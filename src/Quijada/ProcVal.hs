{-# LANGUAGE ExistentialQuantification #-}

module Quijada.ProcVal where

import Data.Typeable


data Val = forall v. (Show v, Typeable v) => KV String v

instance Show Val where
    show (KV k v) = "(" ++ show k ++ ": " ++ show v ++ ")"


kvLookup1 :: String -> [Val] -> Maybe Val
kvLookup1 _ [] = Nothing
kvLookup1 needle (kv@(KV k v):haystack) = if needle == k then Just kv else kvLookup1 needle haystack
-- ^ eg: kvLookup1 "Cd" values -- returns as a Maybe Val the nested Val associated with the key "Cd" in data "values"


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
