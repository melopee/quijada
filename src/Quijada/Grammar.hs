{-# LANGUAGE TupleSections #-}

module Quijada.Grammar where

import Quijada.Utils
import Quijada.Values
import Text.Parsec

-- TODO:
-- build script for convert_value.sh
-- generate those with Phonology.hs
-- merge Phonology.hs, the .hjson data and ValProc.hs in a coherent scheme
-- preproc the input: replace weird chars with space so that error column/line is still relevant in the not preprocessed input
-- check for phonotactics before parsing words
-- check for stress after having parsed words
-- build inter-word dependency relation after having parsed words



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


á :: ParserTree
á = N <$> string "á"

é :: ParserTree
é = N <$> string "é"

ó :: ParserTree
ó = N <$> string "ó"

ú :: ParserTree
ú = N <$> string "ú"

í :: ParserTree
í = N <$> string "í"


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
consonant = p <|> b <|> t <|> d <|> k <|> g {- <|> glottal -} <|> f <|> v <|> ţ <|> ḑ <|> s <|> z <|> š <|> ž <|> x <|> h <|> ļ <|> c <|> ż <|> č <|> j <|> m <|> n <|> ň <|> r <|> l <|> w <|> y <|> ř

vowel :: ParserTree
vowel = a <|> e <|> o <|> u <|> i
    <|> ä <|> ë <|> ö <|> ü
    <|> à <|> è <|> ò <|> ù <|> ì
    <|> á <|> é <|> ó <|> ú <|> í
    <|> â <|> ê <|> ô <|> û <|> î



iDiphthong :: ParserTree
iDiphthong = parser__from_values__ "" ["ai", "ei", "oi", "ui", "ëi"]

uDiphthong :: ParserTree
uDiphthong = parser__from_values__  "" ["au", "eu", "ou", "iu", "ëu"]

diphthong :: ParserTree
diphthong = try iDiphthong <|> uDiphthong

disjunct :: ParserTree
disjunct = no diphthong *> vowel >< vowel

wy :: ParserTree
wy = w <|> y

glottal_wy :: ParserTree
glottal_wy = try (glottal >< w) <|> (glottal >< y)

monoconsonantal :: ParserTree
monoconsonantal =
    no ļ *> no glottal *> no h *> no w *> no y *>
    consonant

biconsonantal :: ParserTree
biconsonantal =
    no (h><l) *> no (h><r) *> no (h><m) *> no (h><n) *> no (h><w) *> no (h><y) *>
    no h *>
    consonant >< consonant

triconsonantal :: ParserTree
triconsonantal =
    no (h><l><l) *> no (h><r><r) *> no (h><m><m) *> no (h><n><n) *> no (h><y><w) *> no (h><h><y) *> no (h><l><w) *> no (h><r><w) *> no (h><m><w) *> no (h><n><w) *> no (h><l><y) *> no (h><r><y) *> no (h><m><y) *> no (h><n><y) *>
    no h *>
    consonant >< consonant >< consonant






-- vr_ins = setk "V*" <$> do
--     _vr <- vr
--     case _vr of
--         P k _vr -> if length _vr == 2
--                  then modifyState ((P k [_vr!!1]):)
--                  else modifyState ((P k _vr):)
--         _ -> parserZero

--     _cd <- try glottal_wy <|> try wy <|> glottal

--     if _cd `eqv` (N "’")
--         then return _cd
--         else do
--             _v <- try vowel
--             state <- getState
--             case kvLookup1 "Vr" state of
--                 [] -> unexpected "error: expected a V* slot, must appear after a Vr slot"
--                 (res:_) -> if res `eqv` _v
--                  then return (concaTrees [_vr, _cd, _v])
--                  else unexpected "error: V* does not match Vr2."



isSingle v = case (run vowel v) of
    Left _ -> False
    Right _ -> True

isIDiphthong v = case (run iDiphthong v) of
    Left _ -> False
    Right _ -> True

isUDiphthong v = case (run uDiphthong v) of
    Left _ -> False
    Right _ -> True

isDiphthong v = isIDiphthong v || isUDiphthong v

isDisjunct v = case (run disjunct v) of
    Left _ -> False
    Right _ -> True




extract m v =
    if
        ( (isDisjunct v && m /= "") || (isIDiphthong v && (m == "y" || m == "’y")) || (isUDiphthong v && (m == "w" || m == "’w")) )
    then
        [([v!!0], [desaccentify $ v!!1])]
    else
        map (v,) (if m == "" then
                [""]
            else if m == "h" || m == "’" || m == "’h" then
                (if isDiphthong v then
                        [[v!!0], ""]
                    else -- so v is a sinle vowel
                        [v, ""]
                )
            else (if isDiphthong v then
                    [[v!!0]]
                else -- so v is a sinle vowel
                    [v]
            )
        )

insert :: String -> String -> String -> [ParserTree]
insert name m v = for (extract m v) (\(first, second) -> do
    _first <- N <$> string first
    _sep <- N <$> string m
    _second <- N <$> (string second) <?> "insert error"
    return (concaTrees [_first, _sep, _second])
    )

--| TODO: this function never report the insert error as it generates all the parser *then* try them all one by one
-- instead, the first part (e.g. Vr1) should be tried for all vals; when a correct one is found, it should be accepted, *then* Vr2 should be tried and if it does not match Vr1, here goes the insert error
parser__inserting__into__ :: String -> [String] -> [String] -> ParserTree
parser__inserting__into__ name mods vals = setk name <$> (tryThemAll . concat $ [ insert name mod val | mod <- mods, val <- vals ])


vr :: ParserTree
vr = parser_from_slot__ "Vr"

vr_ins :: ParserTree
vr_ins = parser__inserting__into__ "Vr" ["’", "y", "w", "’y", "’w"] (values_of_slot__ "Vr")

initial_cr_raw :: ParserTree
initial_cr_raw =  try triconsonantal <|> try biconsonantal <|> monoconsonantal

mid_cr_raw :: ParserTree
mid_cr_raw = initial_cr_raw

-- raw: used for the phonology or the phonotactics,
-- without raw: used for the morpho-phonology

mid_cr :: ParserTree
mid_cr = (concaTree (P "Cr" "")) <$> mid_cr_raw

initial_cr :: ParserTree
initial_cr = (concaTree (P "Cr" "")) <$> initial_cr_raw

vi :: ParserTree
vi = parser__inserting__into__ "Vi" ["", "’", "h", "’h"] (values_of_slot__ "Vr")

vf :: ParserTree
vf = parser__inserting__into__ "Vf" ["", "w", "y"] (values_of_slot__ "Vc")

ci :: ParserTree
ci = setk "Ci" <$> mid_cr

cs :: ParserTree
cs = (concaTree (P "Cs" "")) <$> mid_cr_raw

vx :: ParserTree
vx = parser_from_slot__ "Vx"

cd :: ParserTree
cd = parser_from_slot__ "Cd"

ca :: ParserTree
ca = parser_from_slot__ "Ca"

vn :: ParserTree
vn = parser_from_slot__ "Vn"

vm1 :: ParserTree
vm1 = parser_from_slot__ "Vm1"

vt1 :: ParserTree
vt1 = parser_from_slot__ "Vt1"

vp :: ParserTree
vp = parser_from_slot__ "Vp"

vl :: ParserTree
vl = parser_from_slot__ "Vl"

ve :: ParserTree
ve = parser_from_slot__ "Ve"

vm2 :: ParserTree
vm2 = parser_from_slot__ "Vm2"

vt2 :: ParserTree
vt2 = parser_from_slot__ "Vt2"

cc :: ParserTree
cc = parser_from_slot__ "Cc"

cm :: ParserTree
cm = parser_from_slot__ "Cm"

vc :: ParserTree
vc = parser_from_slot__ "Vc"

vk :: ParserTree
vk = parser_from_slot__ "Vk"

cb :: ParserTree
cb = (concaTree (P "Cb" "")) <$> glottal >< initial_cr_raw







vcORvk = do
-- TODO: check for stress later, remove state
-- TODO: In order to make this function correct, the state has to be modified when stress is encountered in the formative. An easy way of doing so is checking for stress diacritic at every vowel conjuncts, but that's not pretty.
-- The only "problematic" Vc/Vk values are Cases 1-36 for pre-ante, ante and penultimate stress, the others can solely be determined by their shapes (hence the various test "v `elem` values_of_slot__").
    ck <- parser__from_values__ "Vc/Vk" $ values_of_slot__("Vc") ++ values_of_slot__("Vk")
    let v = valOf ck
    if v `elem` values_of_slot__("Vc")
    then
        if v `elem` values_of_slot__("Vk")
        then
            (do
        state <- getState
        case kvLookup1 "Stress" state of
            [] -> return ck
            (res:_) -> (case valOf res of
                    "pre-antepenultimate" -> return $ setk "Vk" ck
                    "antepenultimate" -> return $ setk "Vk" ck
                    "penultimate" -> return $ setk "Vc" ck
                    "ultimate" -> return $ setk "Vc" ck
                    _ -> return ck)
            )
        else return $ setk "Vc" ck
    else
        if v `elem` values_of_slot__("Vk")
        then return $ setk "Vk" ck
        else return $ ck -- this else branch is impossible, by definition of ck


vt1noXI = parser_from_slot__ "Vt1noXI"

_X_XII = try (vn >< h >< (try cm <|> cc)) <|> ((try vt1noXI <|> vm1) >< (try cm <|> cc))

_X_XI_XII = do
    _x <- (try vn <|> try vt1 <|> vm1)
    _xi <- case (run vowel [last $ valOf _x]) of
        Left e -> (try vp <|> try vl <|> try ve <|> try vm2 <|> vt2) -- slot X ends with ’ or h
        Right i -> try vp <|> try vl <|> try ve <|> try (glottal >< vm2) <|> (glottal >< vt2) -- slot X ends in a vowel
    _xii <- try cm <|> cc
    return $ concaTrees [_x, _xi, _xii]

_X_XI_XII_XIII =
    (try (_X_XI_XII) <|> ((_X_XII) ? zeroTree))
    >< vcORvk

-- | parse slots VII to XIV
formativeTail = setk "formativeTail" <$>
    ((many1Trees (cs >< vx)) >< glottal) ? zeroTree
    ><
        (<|>)
            (
                try (
                    ca >< manyTryTrees (vx >< cs) (_X_XI_XII_XIII)
                )
            )
            (
                (
                    (><)
                        (
                            try ca <|> (h >< (try cm <|> cc))
                        )
                        (
                            (
                                manyTryTrees (vx >< cs) vcORvk
                            )
                        )
                )
            )
    >< (cb ? zeroTree)





simpleFormative = setk "simpleFormative" <$>
    (try (cd >< vr >< mid_cr >< ë) <|> (initial_cr >< vr_ins))

complexFormative = setk "complexFormative" <$>
    cd >< vr >< mid_cr >< vi >< ci >< vf

-- TODO: remove state
word = do
    parse <- (simpleFormative <|> complexFormative)
    putState defaultStateForTNIL -- reset the state at each word (important for stress)
    return parse

sentence = L "sentence" <$> (spaces *> sepEndBy1 word spaces)

root = sentence
