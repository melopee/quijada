module Main where

import Quijada.Grammar
import System.Environment
import Quijada.Utils

main = getArgs <⋅> (head ⁓ (rr root)) >>= putStrLn
