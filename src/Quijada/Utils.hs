{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE NoMonomorphismRestriction #-}

module Quijada.Utils where

import Quijada.Values

import Text.Parsec
import Text.Parsec.String

-- ## utility functions for the AST type, Tree
-- Tree is defined in Values.hs because this file depends on it, and Utils.hs depends on Values.hs

-- "wí’yei’yo haicëmxi’lukš" should be represented as:
-- L "sentence" [
--     L "adjunct1" [
--         P "Cd" "w"
--         L "Vn" [P "vowel" "i", P "consonant" "’"]
--         P "Vp" "yei"
--         P "Vp" "yo"
--         P "Stress" "antepenultimate"
--     ]
--     L simple_formative [
--         P "Cd" "h",
--         P "Vn" "ai"
--         P "Cr" "c"
--         P "Vi" "ë"
--         P "Cs" "mx"
--         P "Vx" "i"
--         P "Cs" "l"
--         P "Vx" "u"
--         P "Cs" "kš"
--     ]
-- ]

-- instance Show Tree where
--     show (N s) = show s
--     show (P s a) = "(" ++ show s ++ ": " ++ show a ++ ")"
--     show (L aa) = "(" ++ (concat . map show $ aa) ++ ")"

zeroTree = L "" []
zeroP = \k -> P k ""

setk n (N _) = N n
setk n (L k v) = L n v
setk n (P k v) = P n v

concaTree = f where
    f (N a) (N b) = N (a ++ b)
    f (N a) (P k v) = P k (a++v)
    f (N a) (L k v) = L k ((N a):v)
    f (P k v) (N b) = P k (v++b)
    f a@(P _ _) b@(P _ _) = L "" [a,b]
    f a@(P _ _) (L k v) = L k (a:v)
    f (L k v) (N b) = L k (v++[(N b)])
    f (L k v) b@(P _ _) = L k (b:v)
    f (L ka va) (L kb vb) = L (ka ++ kb) (va ++ vb)

concaTrees = foldl (concaTree) zeroTree

-- | The only function that relates to Tree and Applicative.
-- | The others above only operate on Tree, thus they can be used freely with fmap on the Parsec's Parser Functor. If they were meddling with Applicative, an empty parser would have to be provided every once and so.
infixl 2 <>
(<>) = \x y -> concaTree <$> x <*> y



-- ## some functions to perform lookup on Tree, as Tree is also used for serializing the scraped morpho-phonological values

kvLookup1 :: String -> [Tree] -> [Tree]
kvLookup1 _ [] = []
kvLookup1 needle ((N hay):stack) = kvLookup1 needle stack
kvLookup1 needle (hay@(P k v):stack) = if needle == k then hay:(kvLookup1 needle stack) else kvLookup1 needle stack
kvLookup1 needle (hay@(L k v):stack) = if needle == k then hay:(kvLookup1 needle stack) else kvLookup1 needle stack

vLeaves :: Tree -> [String]
vLeaves (N s) = [s]
vLeaves (P k v) = [v]
vLeaves (L k v) = concat . map (vLeaves) $ v

kvLeaves :: Tree -> [(String,String)]
kvLeaves (N s) = [([], s)]
kvLeaves (P k v) = [(k, v)]
kvLeaves (L k v) = concat . map kvLeaves $ v

kvLeavesPath :: Tree -> [([String],String)]
kvLeavesPath (N s) = [([], s)]
kvLeavesPath (P k v) = [([k], v)]
kvLeavesPath (L k v) = appendKeysAsPath k . concat . map kvLeavesPath $ v where
    appendKeysAsPath k = map (\(x,y) -> (k:x, y))


-- ## functions generating parsers based on morpho-phonological values

valueFrom _ [] = parserZero
valueFrom v (x:xs) = try (P v <$> string x) <|> (valueFrom v xs)

fromVal v = valueFrom v (vLeaves . head . kvLookup1 v $ values)



-- ## useful and unrelated functions
infixl 2 <⋅>
(<⋅>) = flip (<$>)

infixl 2 ⋅
(⋅) = flip ($)

infixl 2 ⁓
(⁓) = flip (.)

infixl 2 ?
(?) b a = option a b

no = notFollowedBy

run parser = parse parser ""