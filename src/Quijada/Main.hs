module Main where

import Quijada.Grammar
import System.Environment
import Quijada.Combinators

main = getArgs <⋅> (head ⁓ rr) >>= print
