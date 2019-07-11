module Quijada.Grammar where

import Quijada.Utils
import Quijada.Values
import Text.Parsec
import Text.Parsec.String

import Melib

-- TODO:
-- build script for convert_value.sh
-- rewrite ValProc.hs
-- generate those with Phonology.hs
-- merge Phonology.hs, the .hjson data and ValProc.hs in a coherent scheme

p :: ParserTree
p = string "p" <⋅> N

b :: ParserTree
b = string "b" <⋅> N

t :: ParserTree
t = string "t" <⋅> N

d :: ParserTree
d = string "d" <⋅> N

k :: ParserTree
k = string "k" <⋅> N

g :: ParserTree
g = string "g" <⋅> N

glottal :: ParserTree
glottal = string "’" <⋅> N

f :: ParserTree
f = string "f" <⋅> N

v :: ParserTree
v = string "v" <⋅> N

ţ :: ParserTree
ţ = string "ţ" <⋅> N

ḑ :: ParserTree
ḑ = string "ḑ" <⋅> N

s :: ParserTree
s = string "s" <⋅> N

z :: ParserTree
z = string "z" <⋅> N

š :: ParserTree
š = string "š" <⋅> N

ž :: ParserTree
ž = string "ž" <⋅> N

x :: ParserTree
x = string "x" <⋅> N

h :: ParserTree
h = string "h" <⋅> N

ļ :: ParserTree
ļ = string "ļ" <⋅> N

c :: ParserTree
c = string "c" <⋅> N

ż :: ParserTree
ż = string "ż" <⋅> N

č :: ParserTree
č = string "č" <⋅> N

j :: ParserTree
j = string "j" <⋅> N

m :: ParserTree
m = string "m" <⋅> N

n :: ParserTree
n = string "n" <⋅> N

ň :: ParserTree
ň = string "ň" <⋅> N

r :: ParserTree
r = string "r" <⋅> N

l :: ParserTree
l = string "l" <⋅> N

w :: ParserTree
w = string "w" <⋅> N

y :: ParserTree
y = string "y" <⋅> N

ř :: ParserTree
ř = string "ř" <⋅> N

a :: ParserTree
a = string "a" <⋅> N

e :: ParserTree
e = string "e" <⋅> N

o :: ParserTree
o = string "o" <⋅> N

u :: ParserTree
u = string "u" <⋅> N

i :: ParserTree
i = string "i" <⋅> N

ä :: ParserTree
ä = string "ä" <⋅> N

ë :: ParserTree
ë = string "ë" <⋅> N

ö :: ParserTree
ö = string "ö" <⋅> N

ü :: ParserTree
ü = string "ü" <⋅> N

à :: ParserTree
à = string "à" <⋅> N

è :: ParserTree
è = string "è" <⋅> N

ò :: ParserTree
ò = string "ò" <⋅> N

ù :: ParserTree
ù = string "ù" <⋅> N

ì :: ParserTree
ì = string "ì" <⋅> N

â :: ParserTree
â = string "â" <⋅> N

ê :: ParserTree
ê = string "ê" <⋅> N

ô :: ParserTree
ô = string "ô" <⋅> N

û :: ParserTree
û = string "û" <⋅> N

î :: ParserTree
î = string "î" <⋅> N


consonant :: ParserTree
consonant = p <|> b <|> t <|> d <|> k <|> g <|> glottal <|> f <|> v <|> ţ <|> ḑ <|> s <|> z <|> š <|> ž <|> x <|> h <|> ļ <|> c <|> ż <|> č <|> j <|> m <|> n <|> ň <|> r <|> l <|> w <|> y <|> ř

vowel :: ParserTree
vowel = a <|> e <|> o <|> u <|> i <|> ä <|> ë <|> ö <|> ü <|>
        à <|> è <|> ò <|> ù <|> ì <|> â <|> ê <|> ô <|> û <|> î

wy :: ParserTree
wy = w <|> y

glottal_wy :: ParserTree
glottal_wy = (glottal >< w) <|> (glottal >< y)

monoconsonantal :: ParserTree
monoconsonantal = no ļ *> no glottal *> no h *> no y *> no w *> consonant

polyconsonantal :: ParserTree
polyconsonantal = consonant >< (concaTrees <$> many1 consonant)

initial_cr_raw :: ParserTree
initial_cr_raw = monoconsonantal <|> polyconsonantal -- <⋅> (concaTree (zeroP "Cr"))

mid_cr_raw :: ParserTree
mid_cr_raw = (concaTrees <$> many1 consonant) -- <⋅> (concaTree (zeroP "Cr"))

mid_cr :: ParserTree
mid_cr = mid_cr_raw <⋅> (concaTree (zeroP "Cr"))

initial_cr :: ParserTree
initial_cr = initial_cr_raw <⋅> (concaTree (zeroP "Cr"))


vr_stateless :: ParserTree
vr_stateless = fromVal "Vr"

vr :: ParserTree
vr = do
    x <- vr_stateless
    case x of
        P k v -> (if length v == 2 then modifyState ((P k [v!!1]):) else modifyState ((P k v):))
        _ -> return ()
    return x

cd :: ParserTree
cd = fromVal "Cd"

ca :: ParserTree
ca = fromVal "Ca"

vx :: ParserTree
vx = fromVal "Vx"

cs :: ParserTree
cs = mid_cr_raw <⋅> (concaTree (zeroP "Cs"))

vn :: ParserTree
vn = fromVal "Vn"

vm1 :: ParserTree
vm1 = fromVal "Vm1"

vt1 :: ParserTree
vt1 = fromVal "Vt1"

vp :: ParserTree
vp = fromVal "Vp"

vl :: ParserTree
vl = fromVal "Vl"

ve :: ParserTree
ve = fromVal "Ve"

vm2 :: ParserTree
vm2 = fromVal "Vm2"

vt2 :: ParserTree
vt2 = fromVal "Vt2"

cc :: ParserTree
cc = fromVal "Cc"

cm :: ParserTree
cm = fromVal "Cm"

vc :: ParserTree
vc = fromVal "Vc"

vk :: ParserTree
vk = fromVal "Vk"

cb :: ParserTree
cb = glottal >< initial_cr_raw <⋅> (concaTree (zeroP "Cb"))

vstar :: ParserTree
vstar = do
    x <- try vowel -- <|> try (glottal >< vr_stateless) <|> try (wy >< vr_stateless) <|> (glottal_wy >< vr_stateless)
    state <- getState
    case kvLookup1 "Vr" (traceIt state) of
        [] -> unexpected "error: expected a V* slot, must appear after a Vr slot"
        (res:_) -> if (traceIt res) `eqv` (traceIt x) then return x
            else unexpected "error: V* does not match Vr2."

-- | parse slots VII to XIV
formativeTail = ca 
    >< ({-many-} (vx >< cs))
    >< ((vn <|> vm1 <|> vt1) >< (vp <|> vl <|> ve <|> vm2 <|> vt2) >< (cc <|> cm)) >< (vc <|> vk) >< (cb ? zeroTree)
    <⋅> setk "formativeTail"

simpleFormative =
    (try (cd >< vr >< mid_cr >< ë) <|> (initial_cr >< vr >< vstar))
    <⋅> setk "simpleFormative"
    -- >< formativeTail

complexFormative = simpleFormative

root = simpleFormative <|> complexFormative
