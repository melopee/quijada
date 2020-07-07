

macro_rules! alt {
  ( @acc $i:ident = [] -> $($body:tt,)* ) =>
  (
    let $i = alt( $($body,)* );
  );

  ( @acc $i:ident = [$e:ident, $($tail:ident)*] -> $($body:tt,)* ) =>
  (
    let $e = tag(stringify!($e));
    alt!(@acc $i = [$($tail,)*] -> ($($body),* $e),);
  );

  ( $i:ident = [$e:ident, $($tail:ident)*] ) =>
  (
    alt!(@acc $i = [$e, $($tail)*] -> (),);
  );

  // ( $i:ident = [$($e:ident) *, $($tail:tt)*] ) =>
  // (

  // );

  // ( $i:ident = [$($e:ident) *, $($tail:tt)*] ) =>
  // (

  // );

}






macro_rules! grammar {
    () => {};
    (let $i:ident = $e:expr; $($tail:tt)*) =>
    (
        let $i = $e;
        grammar!($($tail)*);
    );
    (let $i:ident N= $e:expr; $($tail:tt)*) =>
    (
        let $i = map($e, SynTree::N);
        grammar!($($tail)*);
    );
    (let $i:ident S= $e:expr; $($tail:tt)*) =>
    (
        let $i = map($e, SynTree::S);
        grammar!($($tail)*);
    );
    (let $i:ident P= $e:expr; $($tail:tt)*) =>
    (
        let $i = map($e, |x| SynTree::P(stringify!($i),x));
        grammar!($($tail)*);
    );
    (let $i:ident L= $e:expr; $($tail:tt)*) =>
    (
        let $i = map($e, |x| SynTree::L(stringify!($i),x));
        grammar!($($tail)*);
    );
    ($e:stmt; $($tail:tt)*) =>
    (
        $e
        grammar!($($tail)*);
    );
}


macro_rules! alt {
    (let $i:ident = $(let $a:ident = $e:expr);*) =>
    (
        $(let $a = $e);*;
        let $i = alt(( $($a,)* ));
    )
}







let unstressed_ai N= tag("ai");
let unstressed_au N= tag("au");
let unstressed_ei N= tag("ei");
let unstressed_eu N= tag("eu");
let unstressed_ëi N= tag("ëi");
let unstressed_ou N= tag("ou");
let unstressed_oi N= tag("oi");
let unstressed_iu N= tag("iu");
let unstressed_ui N= tag("ui");

let stressed_ai N= tag("ái");
let stressed_au N= tag("áu");
let stressed_ei N= tag("éi");
let stressed_eu N= tag("éu");
let stressed_ëi N= tag("êi");
let stressed_ou N= tag("óu");
let stressed_oi N= tag("ói");
let stressed_iu N= tag("íu");
let stressed_ui N= tag("úi");



let unstressed_a = tag("a");
let unstressed_ä = tag("ä");
let unstressed_e = tag("e");
let unstressed_ë = tag("ë");
let unstressed_i = tag("i");
let unstressed_ö = tag("ö");
let unstressed_o = tag("o");
let unstressed_ü = tag("ü");
let unstressed_u = tag("u");

let stressed_a = tag("á");
let stressed_ä = tag("â");
let stressed_e = tag("é");
let stressed_ë = tag("ê");
let stressed_i = tag("í");
let stressed_ö = tag("ô");
let stressed_o = tag("ó");
let stressed_ü = tag("û");
let stressed_u = tag("ú");


alt! {
    let serie1 =
    let a = alt((stressed_a,unstressed_a));
    let ä = alt((stressed_ä,unstressed_ä));
    let e = alt((stressed_e,unstressed_e));
    let ë = alt((stressed_ë,unstressed_ë));
    let i = alt((stressed_i,unstressed_i));
    let ö = alt((stressed_ö,unstressed_ö));
    let o = alt((stressed_o,unstressed_o));
    let ü = alt((stressed_ü,unstressed_ü));
    let u = alt((stressed_u,unstressed_u))
};






let serie1 = alt! {
    let a = alt((stressed_a,unstressed_a));
    let ä = alt((stressed_ä,unstressed_ä));
    let e = alt((stressed_e,unstressed_e));
    let ë = alt((stressed_ë,unstressed_ë));
    let i = alt((stressed_i,unstressed_i));
    let ö = alt((stressed_ö,unstressed_ö));
    let o = alt((stressed_o,unstressed_o));
    let ü = alt((stressed_ü,unstressed_ü));
    let u = alt((stressed_u,unstressed_u));
};



let serie2 L= alt {
    let ai L= alt((stressed_ai, unstressed_ai));
    let au L= alt((stressed_au, unstressed_au));
    let ei L= alt((stressed_ei, unstressed_ei));
    let eu L= alt((stressed_eu, unstressed_eu));
    let ëi L= alt((stressed_ëi, unstressed_ëi));
    let ou L= alt((stressed_ou, unstressed_ou));
    let oi L= alt((stressed_oi, unstressed_oi));
    let iu L= alt((stressed_iu, unstressed_iu));
    let ui L= alt((stressed_ui, unstressed_ui));
};

let serie3 L= alt {
    alt {
        let ia L= tuple((i, a));
        let oä L= tuple((o, ä));
    },
    alt {
        let iä L= tuple((i, ä));
        let uä L= tuple((u, ä));
    },
    alt {
        let ie L= tuple((i, e));
        let oë L= tuple((o, ë));
    },
    alt {
        let ië L= tuple((i, ë));
        let uë L= tuple((u, ë));
    },
    let ëu L= tuple((ë, u));
    alt {
        let uö L= tuple((u, ö));
        let iö L= tuple((i, ö));
    },
    alt {
        let uo L= tuple((u, o));
        let io L= tuple((i, o));
    },
    alt {
        let ue L= tuple((u, e));
        let eö L= tuple((e, ö));
    },
    alt {
        let ua L= tuple((u, a));
        let aö L= tuple((a, ö));
    },
};

let serie4 L= alt {
    let ao L= tuple((a, o));
    let ae L= tuple((a, e));
    let ea L= tuple((e, a));
    let eo L= tuple((e, o));
    let eë L= tuple((e, ë));
    let öe L= tuple((ö, e));
    let oe L= tuple((o, e));
    let öa L= tuple((ö, a));
    let oa L= tuple((o, a));
};

let serie5 L= alt {
    let a’a L= tuple((a, ’, a));
    let ä’ä L= tuple((ä, ’, ä));
    let e’e L= tuple((e, ’, e));
    let ë’ë L= tuple((ë, ’, ë));
    let i’i L= tuple((i, ’, i));
    let ö’ö L= tuple((ö, ’, ö));
    let o’o L= tuple((o, ’, o));
    let ü’ü L= tuple((ü, ’, ü));
    let u’u L= tuple((u, ’, u));
};

let serie6 L= alt {
    let a’i L= tuple((a, ’, i));
    let a’u L= tuple((a, ’, u));
    let e’i L= tuple((e, ’, i));
    let e’u L= tuple((e, ’, u));
    let ë’i L= tuple((ë, ’, i));
    let o’u L= tuple((o, ’, u));
    let o’i L= tuple((o, ’, i));
    let i’u L= tuple((i, ’, u));
    let u’i L= tuple((u, ’, i));
};

let serie7 L= alt {
    let i’a L= tuple((i, ’, a));
    let i’ä L= tuple((i, ’, ä));
    let i’e L= tuple((i, ’, e));
    let i’ë L= tuple((i, ’, ë));
    let ë’u L= tuple((ë, ’, u));
    let u’ö L= tuple((u, ’, ö));
    let u’o L= tuple((u, ’, o));
    let u’e L= tuple((u, ’, e));
    let u’a L= tuple((u, ’, a));
};

let serie8 L= alt {
    let a’o L= tuple((a, ’, o));
    let a’e L= tuple((a, ’, e));
    let e’a L= tuple((e, ’, a));
    let e’o L= tuple((e, ’, o));
    let e’ë L= tuple((e, ’, ë));
    let ö’e L= tuple((ö, ’, e));
    let o’e L= tuple((o, ’, e));
    let ö’a L= tuple((ö, ’, a));
    let o’a L= tuple((o, ’, a));
};