src="data/$1"
trg="src/Quijada/Values.hs"
if [ -e "$src" ]; then
    if ! [ -e "$trg" ]; then
    cp "$src" "$trg" &&
    perl -i -p -e 'y/{}/[]/;s/"(.*)": \[/KL "$1" \[/g;s/"(.*)": "(.*)"/KV "$1" "$2"/g;' "$trg" &&
    perl -i -p -e 'print "module Quijada.Values where

data Values = KLL String [[Values]] | KL String [Values] | KV String String deriving (Show)

values = " if $. == 1' "$trg" &&
    perl -i -p -e 's/KL "Cd"/KLL "Cd"/g' "$trg" &&
    perl -i -p -e 's/KL "Vr"/KLL "Vr"/g' "$trg";
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
    echo "$1 does not exist, aborting"
fi