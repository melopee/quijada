module Quijada.Parser where

import Quijada.Values
import Data.Typeable

-- can't extract only v as it would escape Values's scope, but can't parametrize it in Values either as the values can be Values, [Values], [[Values]]; and we want this behavior
vlookup :: String -> [Values] -> Res
vlookup _ [] = Empty
vlookup needle ((KV k v):haystack) = if needle == k then extract (KV k v) else vlookup needle haystack where
    extract :: Values -> Res
    extract (KV k v) = case (cast v :: Maybe Values) of
      Just s -> Mks s
      Nothing -> case (cast v :: Maybe [Values]) of
          Just ss -> MkLs ss
          Nothing -> case (cast v :: Maybe [[Values]]) of
              Just sss -> MkLLs sss
              Nothing -> Empty


data Res = MkLLs [[Values]] | MkLs [Values] | Mks Values | Empty deriving (Show)





