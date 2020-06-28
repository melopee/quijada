extern crate pom;
use pom::parser::*;
// use pom::parser::Parser;
use std::fmt;

#[derive(Debug, PartialEq)]
pub enum SynTree<'a> {
    N(String), // Name 
    P(&'a str, &'a str), // Property
    L(&'a str, Vec<SynTree<'a>>), // List
}


impl<'a> fmt::Display for SynTree<'a> {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        aux_fmt(self, f, 0)
    }
}


fn aux_fmt(s: &SynTree, f: &mut fmt::Formatter<'_>, d: usize) -> fmt::Result {
    match s {
        SynTree::N(s) => {
            writeln!(f, "├{} {}", "─".repeat(d), s)
        },
        SynTree::P(k,v) => {
            writeln!(f, "├{} {}: {}", "─".repeat(d), k, v)
        },
        SynTree::L(k,v) => {
            writeln!(f, "├{} {}", "─".repeat(d), k)?;
            for i in v {
                aux_fmt(i, f, d+1)?;
            };
            Ok(())
        },
    }
}


macro_rules! grammar_rule {
    ($i:ident N= $e:expr) => ( let $i = $e.map(SynTree::N); );
    ($i:ident P= $e:expr) => ( let $i = $e.map(|e| SynTree::P(stringify!($i),e)); );
    ($i:ident L= $e:expr) => ( let $i = $e.map(|e| SynTree::L(stringify!($i),e)); );
    ($i:ident L|= $e:expr) => ( let $i = || $e.map(|e| SynTree::L(stringify!($i),e)); );
}

// macro_rules! grammar! {
//     ($i:ident N= $e:expr) => ( let $i = $e.map(SynTree::N); );
//     ($i:ident P= $e:expr) => ( let $i = $e.map(|e| SynTree::P(stringify!($i),e)); );
//     ($i:ident L= $e:expr) => ( let $i = $e.map(|e| SynTree::L(stringify!($i),e)); );
// }

// macro_rules! grammar {
//     (
//         $(
//             $x:expr; [ $( $y:expr ),* ]
//         );*
//     ) => {
//         &[ $($( $x + $y ),*),* ]
//     }
// }


fn main() {
    let space = || one_of(b" \t\r\n").discard();
    // let space = || one_of(b" \t\r\n").repeat().discard(); // 1) with .repeat here

    grammar_rule!( consonant N= one_of( "pbtdkg'fvţḑszšžxhļcżčjmnňrlwyř".as_bytes() ).repeat(1..).convert(String::from_utf8) );
    grammar_rule!( vowel N= one_of( "aeouiäëöüàèòùìáéóúíâêôûî".as_bytes() ).repeat(1..).convert(String::from_utf8) );

    // grammar_rule!( consonant N= seq( "pbtdkg'fvţḑszšžxhļcżčjmnňrlwyř".as_bytes() ).convert( |e| String::from_utf8(e.into_iter().map(|&x| x).collect())) );
    // grammar_rule!( vowel N= seq( "aeouiäëöüàèòùìáéóúíâêôûî".as_bytes() ).convert( |e| String::from_utf8(e.into_iter().map(|&x| x).collect())) );

    let a = sym(b'a').map(|_| SynTree::N("a".to_string()));
    let b = sym(b'b').map(|_| SynTree::N("b".to_string()));

    grammar_rule!( word L= list(consonant, a) ); // 2) and a double call to list here

    // let word = consonant;

    grammar_rule!( sentence L= space() * list(word, space()) ); // 3) and here, pom seems to be stuck in an infinite loop
    // 4) I don't really know pom, but that this simple thing does not work out of the box is quite weird
    // 5) For now I have other libraries to try, so I'll move forward
    // 6) Besides another problem was that I couldn't manage to make pom work not with u8, which is kinda annoying for utf8

    // grammar_rule!( text L=space() * list(sentence, sym(b'.')) - space() );

    match std::env::args().nth(1) {
        Some(expr) => {
            let parser = sentence;
            let input = expr.as_bytes();
            let output = parser.parse(input);
            match output {
                Ok(o) => print!("Ok: {}", o),
                Err(e) => println!("Err: {}", e),
            }
        },
        None => (),
    }
}
    // let expr = std::env::args().skip(1).fold("".to_string(), |acc, x| acc+" "+&x);
    // let input = expr.as_bytes();
    // let output = root().parse(input);
    // println!("{:?}", output);


