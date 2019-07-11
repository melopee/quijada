module Main where

import Quijada.Grammar
import System.Environment
import Quijada.Utils

main = (\args -> if null args then "Not enough args!" else ((rr root) . head $ args)) <$> getArgs >>= putStrLn
