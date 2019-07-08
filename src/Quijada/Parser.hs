{-# LANGUAGE FlexibleContexts #-}

module Quijada.Parser where

import Quijada.Values
import Data.Typeable
import Data.Maybe
import Text.Parsec
import Text.Parsec.String

infixl 0 ⋅
(⋅) = flip ($)


kvLookup1 :: String -> [Val] -> Maybe Val
kvLookup1 _ [] = Nothing
kvLookup1 needle (kv@(KV k v):haystack) = if needle == k then Just kv else kvLookup1 needle haystack
-- ^ eg: kvLookup1 "Cd" values -- returns as a Maybe Val the nested Val associated with the key "Cd" in data "values"


-- | performs a flat lookup on a list of Val, i.e. the depth of the lookup is 1
-- | presupose that v is either Val, [Val] or [[Val]], else returns Null
vLookup1 :: String -> [Val] -> ValDic
vLookup1 _ [] = Null
-- Can't extract only v as it would escape Val's scope, but can't parametrize it in Val either as the values can be Val, [Val], [[Val]]; and we want this behavior
-- `extract` is thus used to extract the value from the type, and store it in a more normal structure, ValDic
vLookup1 needle ((KV k v):haystack) = if needle == k then extract (KV k v) else vLookup1 needle haystack where
    extract :: Val -> ValDic
    extract (KV k v) = case (cast v :: Maybe Val) of
      Just s -> Mks s
      Nothing -> case (cast v :: Maybe [Val]) of
          Just ss -> MkLs ss
          Nothing -> case (cast v :: Maybe [[Val]]) of
              Just sss -> MkLLs sss
              Nothing -> Null
-- ^ eg: vLookup1 "Cd" values -- returns as a ValDic the nested Val associated with the key "Cd" in data "values"

data ValDic = MkLLs [[Val]] | MkLs [Val] | Mks Val | Null deriving (Show)

extractValDic v = case v of 
    Mks vv -> [[vv]]
    MkLs vv -> [vv]
    MkLLs vv -> vv


-- | recursive loovup function, supposing that keys are strings and generic on values
-- kLoovup :: a -> Val -> [Maybe String]""
-- kLoovup antineedle (KV k v) =
--         if typeOf antineedle == typeOf v && antineedle == v
--             then [Just k]
--             else case (cast v :: Maybe [Val]) of
--                 Just l -> concat $ map (kLoovup antineedle) l
--                 Nothing -> []

-- | lookup: takes a needle, that is matched on keys
-- ^ loovup: takes a antineedle, that is matched on values

-- | recursive loovup function supposing that keys and values are strings
kLoovup :: String -> Val -> [String]
kLoovup antineedle (KV k v) =
    case (cast v :: Maybe String) of
        Just s -> if s == antineedle then [k] else []
        Nothing -> case (cast v :: Maybe [Val]) of
            Just l -> concat $ map (kLoovup antineedle) l
            Nothing -> case (cast v :: Maybe [[Val]]) of
                Just sss -> concat . map (concat . map (kLoovup antineedle)) $ sss
                Nothing -> []
-- ^ eg: kLoovup "h" $ kvLookup1 "Cd" values -- return the key of the value "h" in the Cd table



vLeaves :: Val -> [String]
vLeaves (KV k v) = case (cast v :: Maybe String) of
  Just s -> [s]
  Nothing -> case (cast v :: Maybe [Val]) of
      Just ss -> concat . map vLeaves $ ss
      Nothing -> case (cast v :: Maybe [[Val]]) of
          Just sss -> concat . map (vLeaves . KV "") $ sss
          Nothing -> []

-- | return (key, value) leaves, i.e. in a nested Val structure, search the items typed as (String, String), and return them in a list
kvLeaves :: Val -> [(String, String)]
kvLeaves (KV k v) = case (cast v :: Maybe String) of
  Just s -> [(k,s)]
  Nothing -> case (cast v :: Maybe [Val]) of
      Just ss -> concat . map kvLeaves $ ss
      Nothing -> case (cast v :: Maybe [[Val]]) of
          Just sss -> concat . map (concat . map kvLeaves) $ sss
          Nothing -> []
-- ^ eg: kvLookup1 "Vx" values ⋅ fromJust ⋅ kvLeaves -- return a list of (key, value) made from the Vx table

-- | Same as `kvLeaves`, but appends the nested keys met during the traversal and returns them instead of the single last key
kvLeavesPath :: Val -> [([String], String)]
kvLeavesPath (KV k v) = case (cast v :: Maybe String) of
  Just s -> [([k],s)]
  Nothing -> case (cast v :: Maybe [Val]) of
      Just ss -> appendKeysAsAPath k . concat . map kvLeavesPath $ ss
      Nothing -> case (cast v :: Maybe [[Val]]) of
          Just sss -> appendKeysAsAPath k . concat . map (concat . map kvLeavesPath) $ sss
          Nothing -> []
  where
    appendKeysAsAPath k = map (\(x,y) -> (k:x, y))



valueFrom [] = parserZero
valueFrom (x:xs) = try (string x <* eof) <|> (valueFrom xs)

vr :: Parser String
vr = valueFrom (vLeaves $ fromJust $ kvLookup1 "Vr" values)

consonant :: Parser Char
consonant = oneOf "pbtdkg’fvţḑszšžxhļcżčjmnňrlwyř"

vowel :: Parser Char
vowel = oneOf "aeouiäëöü"


-- formativeTail = -- VII to XIV
-- inValidnitialCr_simpleFormative = cd <*> vr <*> mid_cr <*> vr <*> formativeTail
-- validInitialCr_simpleFormative = initial_cr <*> vr <*> vstar <*> formativeTail
-- simpleFormative = validInitialCr_simpleFormative <|> inValidnitialCr_simpleFormative
-- root = simpleFormative <|> complexFormative

root :: Parser String
root = string "ith"



p parser = parse parser ""
r = p root



