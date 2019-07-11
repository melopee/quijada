{-# LANGUAGE FlexibleContexts #-}

module Quijada.Utils where

import Quijada.Values

import Text.Parsec
import Data.List

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

instance Show Tree where
    show (N s) = prettyShow s
    show (P s a) = "(" ++ prettyShow s ++ ": " ++ prettyShow a ++ ")"
    show (L s aa) = "(" ++ prettyShow s ++ ": " ++ (intercalate ", " . map prettyShow $ aa) ++ ")"

zeroTree = L "" []
zeroP = \k -> P k ""

setk n (N _) = N n
setk n (L k v) = L n v
setk n (P k v) = P n v

eqv (N a) (N b) = a == b
eqv (N a) (P k v) = a == v
eqv (N a) (L k v) = False
eqv (P k v) (N b) = v == b
eqv (P ka va) (P kb vb) = va == vb
eqv a@(P _ _) (L k v) = False
eqv (L k v) (N b) = False
eqv (L k v) b@(P _ _) = False
eqv (L ka va) (L kb vb) = and $ zipWith (eqv) va vb


concaTree (N a) (N b) = N (a ++ b)
concaTree (N a) (P k v) = P k (a++v)
concaTree (N a) (L k v) = L k ((N a):v)
concaTree (P k v) (N b) = P k (v++b)
concaTree a@(P _ _) b@(P _ _) = L "" [a,b]
concaTree a@(P _ _) (L k v) = L k (a:v)
concaTree (L k v) (N b) = L k (v++[(N b)])
concaTree (L k v) b@(P _ _) = L k (b:v)
concaTree (L ka va) (L kb vb) = L (ka ++ kb) (va ++ vb)

concaTrees :: [Tree] -> Tree
concaTrees = foldl (concaTree) zeroTree

type ParserTree = Parsec String [Tree] Tree

-- | The only function that relates to Tree and Applicative.
-- | The others above only operate on Tree, thus they can be used freely with fmap on the Parsec's Parser Functor. If they were meddling with Applicative, an empty parser would have to be provided every once and so.
infixl 2 ><
(><) :: ParserTree -> ParserTree -> ParserTree
(><) = \x y -> concaTree <$> x <*> y



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

fromVal v = valueFrom v $ vLeaves . head . kvLookup1 v $ values


-- ## useful and unrelated functions
infixl 2 ?
(?) b a = option a b

no :: (Stream s m t, Show a) => ParsecT s u m a -> ParsecT s u m ()
no = notFollowedBy



prettyShow :: Show a => a -> String
prettyShow x = con (show x) where
  con :: String -> String
  con [] = ([])
  con li@(x:xs) | x == '\"' = str++(con rest)
                | x == '\'' = char:(con rest')
                | otherwise = x:con xs where
                  (str,rest):_ = reads li
                  (char,rest'):_ = reads li

prettyState r = case r of
    Left e -> prettyShow e
    Right (parse,state) -> ("parse: " ++ prettyShow parse) ++ "\n" ++ ("state: " ++ prettyShow state)

prettyNotState r = case r of
    Left e -> prettyShow e
    Right i -> prettyShow i



appendStateTo parser = parser >>= (\parse -> (getState >>= (\state -> return (parse, state))))

run parser = runParser parser [] ""

runWith state parser = runParser parser state ""

runShow parser = runParser (appendStateTo parser) [] ""

runWithShow state parser = runParser (appendStateTo parser) state ""


rr parser s = prettyNotState (run parser s)

rrW state parser s = prettyNotState (runWith state parser s)

rrS parser s = prettyState (runShow parser s)

rrWS state parser s = prettyState (runWithShow state parser s)


