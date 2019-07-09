{-# LANGUAGE FlexibleContexts #-}

module Quijada.Parser where

import Quijada.ProcVal
import Quijada.Values
import Text.Parsec
import Text.Parsec.String
import Data.Maybe


valueFrom [] = parserZero
valueFrom (x:xs) = try (string x <* eof) <|> (valueFrom xs)

vfromVal v = valueFrom (vLeaves . fromJust . kvLookup1 v $ values)

p parser = parse parser ""

infixl 2 >*<
(>*<) :: Parser String -> Parser String -> Parser String
(>*<) = \x y -> (++) <$> x <*> y

ë :: Parser String
ë = string "ë"

glottal :: Parser String
glottal = string "’"

wy :: Parser String
wy = try (string "w") <|> string "y"

glottal_wy :: Parser String
glottal_wy = try (string "’w") <|> string "’y"

consonant :: Parser Char
consonant = oneOf "pbtdkg’fvţḑszšžxhļcżčjmnňrlwyř"

vowel :: Parser Char
vowel = oneOf "aeouiäëöü"

mid_cr :: Parser String
mid_cr = many1 consonant

initial_cr :: Parser String
initial_cr = (many1 consonant)

vr :: Parser String
vr = vfromVal "Vr"

cd :: Parser String
cd = vfromVal "Cd"

ca :: Parser String
ca = vfromVal "Ca"

vx :: Parser String
vx = vfromVal "Vx"

cs :: Parser String
cs = mid_cr

vn :: Parser String
vn = vfromVal "Vn"

vm1 :: Parser String
vm1 = vfromVal "Vm1"

vt1 :: Parser String
vt1 = vfromVal "Vt1"

vp :: Parser String
vp = vfromVal "Vp"

vl :: Parser String
vl = vfromVal "Vl"

ve :: Parser String
ve = vfromVal "Ve"

vm2 :: Parser String
vm2 = vfromVal "Vm2"

vt2 :: Parser String
vt2 = vfromVal "Vt2"

cc :: Parser String
cc = vfromVal "Cc"

cm :: Parser String
cm = vfromVal "Cm"

vc :: Parser String
vc = vfromVal "Vc"

vk :: Parser String
vk = vfromVal "Vk"

cb :: Parser String
cb = initial_cr

vstar :: Parser String
vstar = try vr <|> try (glottal >*< vr) <|> try (wy >*< vr) <|> (glottal_wy >*< vr)

-- | parse slots VII to XIV
formativeTail :: Parser String
formativeTail = ca >*< ({-many-} (vx >*< cs)) >*< ((vn <|> vm1 <|> vt1) >*< (vp <|> vl <|> ve <|> vm2 <|> vt2) >*< (cc <|> cm)) >*< (vc <|> vk) >*< cb

simpleFormative :: Parser String
simpleFormative = (try (cd >*< vr >*< mid_cr >*< ë) <|> (initial_cr >*< vr >*< vstar)) >*< formativeTail

complexFormative :: Parser String
complexFormative = simpleFormative

root :: Parser String
root = simpleFormative <|> complexFormative



r = p root




