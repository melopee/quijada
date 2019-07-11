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

p :: ParserTree
p = N <$> string "p"

b :: ParserTree
b = N <$> string "b"

t :: ParserTree
t = N <$> string "t"

d :: ParserTree
d = N <$> string "d"

k :: ParserTree
k = N <$> string "k"

g :: ParserTree
g = N <$> string "g"

glottal :: ParserTree
glottal = N <$> string "’"

f :: ParserTree
f = N <$> string "f"

v :: ParserTree
v = N <$> string "v"

ţ :: ParserTree
ţ = N <$> string "ţ"

ḑ :: ParserTree
ḑ = N <$> string "ḑ"

s :: ParserTree
s = N <$> string "s"

z :: ParserTree
z = N <$> string "z"

š :: ParserTree
š = N <$> string "š"

ž :: ParserTree
ž = N <$> string "ž"

x :: ParserTree
x = N <$> string "x"

h :: ParserTree
h = N <$> string "h"

ļ :: ParserTree
ļ = N <$> string "ļ"

c :: ParserTree
c = N <$> string "c"

ż :: ParserTree
ż = N <$> string "ż"

č :: ParserTree
č = N <$> string "č"

j :: ParserTree
j = N <$> string "j"

m :: ParserTree
m = N <$> string "m"

n :: ParserTree
n = N <$> string "n"

ň :: ParserTree
ň = N <$> string "ň"

r :: ParserTree
r = N <$> string "r"

l :: ParserTree
l = N <$> string "l"

w :: ParserTree
w = N <$> string "w"

y :: ParserTree
y = N <$> string "y"

ř :: ParserTree
ř = N <$> string "ř"

a :: ParserTree
a = N <$> string "a"

e :: ParserTree
e = N <$> string "e"

o :: ParserTree
o = N <$> string "o"

u :: ParserTree
u = N <$> string "u"

i :: ParserTree
i = N <$> string "i"

ä :: ParserTree
ä = N <$> string "ä"

ë :: ParserTree
ë = N <$> string "ë"

ö :: ParserTree
ö = N <$> string "ö"

ü :: ParserTree
ü = N <$> string "ü"

à :: ParserTree
à = N <$> string "à"

è :: ParserTree
è = N <$> string "è"

ò :: ParserTree
ò = N <$> string "ò"

ù :: ParserTree
ù = N <$> string "ù"

ì :: ParserTree
ì = N <$> string "ì"

â :: ParserTree
â = N <$> string "â"

ê :: ParserTree
ê = N <$> string "ê"

ô :: ParserTree
ô = N <$> string "ô"

û :: ParserTree
û = N <$> string "û"

î :: ParserTree
î = N <$> string "î"


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
mid_cr = (concaTree (zeroP "Cr")) <$> mid_cr_raw

initial_cr :: ParserTree
initial_cr = (concaTree (zeroP "Cr")) <$> initial_cr_raw


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
cs = (concaTree (zeroP "Cs")) <$> mid_cr_raw

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
cb = (concaTree (zeroP "Cb")) <$> glottal >< initial_cr_raw

vstar :: ParserTree
vstar = do
    x <- try vowel -- <|> try (glottal >< vr_stateless) <|> try (wy >< vr_stateless) <|> (glottal_wy >< vr_stateless)
    state <- getState
    case kvLookup1 "Vr" state of
        [] -> unexpected "error: expected a V* slot, must appear after a Vr slot"
        (res:_) -> if res `eqv` x then return x
            else unexpected "error: V* does not match Vr2."

-- | parse slots VII to XIV
formativeTail = setk "formativeTail" <$>
    ca >< ({-many-} (vx >< cs))
    >< ((vn <|> vm1 <|> vt1) >< (vp <|> vl <|> ve <|> vm2 <|> vt2) >< (cc <|> cm)) >< (vc <|> vk) >< (cb ? zeroTree)

simpleFormative = setk "formativeTail" <$>
    (try (cd >< vr >< mid_cr >< ë) <|> (initial_cr >< vr >< vstar))

complexFormative = simpleFormative

root = simpleFormative <|> complexFormative
