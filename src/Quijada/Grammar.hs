module Quijada.Grammar where

import Quijada.Utils
import Quijada.Values
import Text.Parsec
import Text.Parsec.String

-- TODO:
-- build script for convert_value.sh
-- rewrite ValProc.hs
-- generate those with Phonology.hs
-- merge Phonology.hs, the .hjson data and ValProc.hs in a coherent scheme

p :: Parser Tree
p = string "p" <⋅> N

b :: Parser Tree
b = string "b" <⋅> N

t :: Parser Tree
t = string "t" <⋅> N

d :: Parser Tree
d = string "d" <⋅> N

k :: Parser Tree
k = string "k" <⋅> N

g :: Parser Tree
g = string "g" <⋅> N

glottal :: Parser Tree
glottal = string "’" <⋅> N

f :: Parser Tree
f = string "f" <⋅> N

v :: Parser Tree
v = string "v" <⋅> N

ţ :: Parser Tree
ţ = string "ţ" <⋅> N

ḑ :: Parser Tree
ḑ = string "ḑ" <⋅> N

s :: Parser Tree
s = string "s" <⋅> N

z :: Parser Tree
z = string "z" <⋅> N

š :: Parser Tree
š = string "š" <⋅> N

ž :: Parser Tree
ž = string "ž" <⋅> N

x :: Parser Tree
x = string "x" <⋅> N

h :: Parser Tree
h = string "h" <⋅> N

ļ :: Parser Tree
ļ = string "ļ" <⋅> N

c :: Parser Tree
c = string "c" <⋅> N

ż :: Parser Tree
ż = string "ż" <⋅> N

č :: Parser Tree
č = string "č" <⋅> N

j :: Parser Tree
j = string "j" <⋅> N

m :: Parser Tree
m = string "m" <⋅> N

n :: Parser Tree
n = string "n" <⋅> N

ň :: Parser Tree
ň = string "ň" <⋅> N

r :: Parser Tree
r = string "r" <⋅> N

l :: Parser Tree
l = string "l" <⋅> N

w :: Parser Tree
w = string "w" <⋅> N

y :: Parser Tree
y = string "y" <⋅> N

ř :: Parser Tree
ř = string "ř" <⋅> N

a :: Parser Tree
a = string "a" <⋅> N

e :: Parser Tree
e = string "e" <⋅> N

o :: Parser Tree
o = string "o" <⋅> N

u :: Parser Tree
u = string "u" <⋅> N

i :: Parser Tree
i = string "i" <⋅> N

ä :: Parser Tree
ä = string "ä" <⋅> N

ë :: Parser Tree
ë = string "ë" <⋅> N

ö :: Parser Tree
ö = string "ö" <⋅> N

ü :: Parser Tree
ü = string "ü" <⋅> N

consonant :: Parser Tree
consonant = p <|> b <|> t <|> d <|> k <|> g <|> glottal <|> f <|> v <|> ţ <|> ḑ <|> s <|> z <|> š <|> ž <|> x <|> h <|> ļ <|> c <|> ż <|> č <|> j <|> m <|> n <|> ň <|> r <|> l <|> w <|> y <|> ř

vowel :: Parser Tree
vowel = a <|> e <|> o <|> u <|> i <|> ä <|> ë <|> ö <|> ü

wy :: Parser Tree
wy = w <|> y

glottal_wy :: Parser Tree
glottal_wy = (glottal <> w) <|> (glottal <> y)

monoconsonantal :: Parser Tree
monoconsonantal = no ļ *> no glottal *> no h *> no y *> no w *> consonant

polyconsonantal :: Parser Tree
polyconsonantal = consonant <> (concaTrees <$> many1 consonant)

initial_cr :: Parser Tree
initial_cr = monoconsonantal <|> polyconsonantal

mid_cr :: Parser Tree
mid_cr = (concaTrees <$> many1 consonant)

vr :: Parser Tree
vr = fromVal "Vr"

cd :: Parser Tree
cd = fromVal "Cd"

ca :: Parser Tree
ca = fromVal "Ca"

vx :: Parser Tree
vx = fromVal "Vx"

cs :: Parser Tree
cs = mid_cr <⋅> (concaTree (zeroP "Cs"))

vn :: Parser Tree
vn = fromVal "Vn"

vm1 :: Parser Tree
vm1 = fromVal "Vm1"

vt1 :: Parser Tree
vt1 = fromVal "Vt1"

vp :: Parser Tree
vp = fromVal "Vp"

vl :: Parser Tree
vl = fromVal "Vl"

ve :: Parser Tree
ve = fromVal "Ve"

vm2 :: Parser Tree
vm2 = fromVal "Vm2"

vt2 :: Parser Tree
vt2 = fromVal "Vt2"

cc :: Parser Tree
cc = fromVal "Cc"

cm :: Parser Tree
cm = fromVal "Cm"

vc :: Parser Tree
vc = fromVal "Vc"

vk :: Parser Tree
vk = fromVal "Vk"

cb :: Parser Tree
cb = glottal <> initial_cr <⋅> (concaTree (zeroP "Cs"))

vstar :: Parser Tree
vstar = try vr <|> try (glottal <> vr) <|> try (wy <> vr) <|> (glottal_wy <> vr)


-- vrstate :: Parsec String [(String,String)] Tree
-- vrstate = do
--     x <- fromVal "Vr"


-- vstate :: Parsec String [(String,String)] Tree


-- | parse slots VII to XIV
formativeTail =
    ca 
    <> ({-many-} (vx <> cs))
    <> ((vn <|> vm1 <|> vt1) <> (vp <|> vl <|> ve <|> vm2 <|> vt2) <> (cc <|> cm)) <> (vc <|> vk) <> (cb ? zeroTree)
    <⋅> setk "formativeTail"

simpleFormative =
    (try (cd <> vr <> mid_cr <> ë) <|> (initial_cr <> vr <> vstar))
    <⋅> setk "simpleFormative"
    -- <> formativeTail

complexFormative = simpleFormative

root = simpleFormative <|> complexFormative

rr s = case run root s of
    Left e -> show e
    Right i -> show i
