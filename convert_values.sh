src="./data/values.v0.8.3.json"
trg="./src/Quijada/Values.hs"
rm "$trg"
if [ -e "$src" ]; then
    if ! [ -e "$trg" ]; then
    cp "$src" "$trg" &&
    perl -i -p \
        -e 'y/{}/[]/;' \
        -e 's/"(.*)": \[/L "$1" \[/g;' \
        -e 's/"(.*)": "(.*)"/P "$1" "$2"/g;' \
        -e 's/^(\s*)\"(.*)\"/$1N \"$2\"/g;' \
        "$trg" &&
    perl -i -p -e 'print "module Quijada.Values where

data Tree = N String | P String String | L String [Tree] deriving (Eq)

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
