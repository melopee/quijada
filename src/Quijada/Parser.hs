{-# LANGUAGE FlexibleContexts #-}

module Quijada.Parser where

import Quijada.ProcVal
import Quijada.Values
import Text.Parsec
import Text.Parsec.String
import Data.Maybe


valueFrom [] = parserZero
valueFrom (x:xs) = try (string x) <|> (valueFrom xs)

vfromVal v = valueFrom (vLeaves . fromJust . kvLookup1 v $ values)

infixl 2 >*<
(>*<) :: Parser String -> Parser String -> Parser String
(>*<) = \x y -> (++) <$> x <*> y

no = notFollowedBy

run parser = parse parser ""

main = run root





-- TODO: generate those with Phonology.hs
-- TODO: merge Phonology.hs, the .hjson data and ValProc.hs in a coherent scheme
p :: Parser String
p = string "p"

b :: Parser String
b = string "b"

t :: Parser String
t = string "t"

d :: Parser String
d = string "d"

k :: Parser String
k = string "k"

g :: Parser String
g = string "g"

glottal :: Parser String
glottal = string "’"

f :: Parser String
f = string "f"

v :: Parser String
v = string "v"

ţ :: Parser String
ţ = string "ţ"

ḑ :: Parser String
ḑ = string "ḑ"

s :: Parser String
s = string "s"

z :: Parser String
z = string "z"

š :: Parser String
š = string "š"

ž :: Parser String
ž = string "ž"

x :: Parser String
x = string "x"

h :: Parser String
h = string "h"

ļ :: Parser String
ļ = string "ļ"

c :: Parser String
c = string "c"

ż :: Parser String
ż = string "ż"

č :: Parser String
č = string "č"

j :: Parser String
j = string "j"

m :: Parser String
m = string "m"

n :: Parser String
n = string "n"

ň :: Parser String
ň = string "ň"

r :: Parser String
r = string "r"

l :: Parser String
l = string "l"

w :: Parser String
w = string "w"

y :: Parser String
y = string "y"

ř :: Parser String
ř = string "ř"

a :: Parser String
a = string "a"

e :: Parser String
e = string "e"

o :: Parser String
o = string "o"

u :: Parser String
u = string "u"

i :: Parser String
i = string "i"

ä :: Parser String
ä = string "ä"

ë :: Parser String
ë = string "ë"

ö :: Parser String
ö = string "ö"

ü :: Parser String
ü = string "ü"



consonant :: Parser String
consonant = p <|> b <|> t <|> d <|> k <|> g <|> glottal <|> f <|> v <|> ţ <|> ḑ <|> s <|> z <|> š <|> ž <|> x <|> h <|> ļ <|> c <|> ż <|> č <|> j <|> m <|> n <|> ň <|> r <|> l <|> w <|> y <|> ř

vowel :: Parser String
vowel = a <|> e <|> o <|> u <|> i <|> ä <|> ë <|> ö <|> ü

wy :: Parser String
wy = w <|> y

glottal_wy :: Parser String
glottal_wy = (glottal >*< w) <|> (glottal >*< y)

mid_cr :: Parser String
mid_cr = (concat <$> many1 consonant)

monoconsonantal :: Parser String
monoconsonantal = no ļ *> no glottal *> no h *> no y *> no w *> consonant

polyconsonantal :: Parser String
polyconsonantal = consonant >*< (concat <$> many1 consonant)

initial_cr :: Parser String
initial_cr = monoconsonantal <|> polyconsonantal

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
simpleFormative = (try (cd >*< vr >*< mid_cr >*< ë) <|> (initial_cr >*< vr >*< vstar)) -- >*< formativeTail

complexFormative :: Parser String
complexFormative = simpleFormative

root :: Parser String
root = simpleFormative <|> complexFormative




