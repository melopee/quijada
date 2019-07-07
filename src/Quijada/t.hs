{-# LANGUAGE ExistentialQuantification #-}

import Data.Typeable

data Values = forall v. (Show v, Typeable v) => KV String v
instance Show Values where
    show (KV k v) = "(" ++ show k ++ ": " ++ show v ++ ")"

