src="./data/$1"
trg="./src/Quijada/Values.hs"
if [ -e "$src" ]; then
    if ! [ -e "$trg" ]; then
    cp "$src" "$trg" &&
    perl -i -p -e 'y/{}/[]/;s/"(.*)": \[/KV "$1" \[/g;s/"(.*)": "(.*)"/KV "$1" "$2"/g;' "$trg" &&
    perl -i -p -e 'print "
{-# LANGUAGE ExistentialQuantification #-}

module Quijada.Values where

import Data.Typeable

data Val = forall v. (Show v, Typeable v) => KV String v
instance Show Val where
    show (KV k v) = \"(\" ++ show k ++ \": \" ++ show v ++ \")\"

values = " if $. == 1' "$trg";
    # perl -i -p -e 's/KL "Cd"/KLL "Cd"/g' "$trg" &&
    # perl -i -p -e 's/KL "Vr"/KLL "Vr"/g' "$trg";
    # the following doesn't work:
    # cat "$trg" | head -n -2 > "$trg"
    # echo '  ]]' >> "$trg"
    # so:
    tmp="$(mktemp)" &&
    cat "$trg" | head -n -2 > "$tmp" &&
    echo '  ]]' >> "$tmp" &&
    cat "$tmp" > "$trg" &&
    rm "$tmp"
    else
        echo "$trg already exists, aborting"
    fi
else
    echo "$src does not exist, aborting"
fi

# cancel:
# rm src/Quijada/Values.hs
