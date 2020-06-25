extern crate pom;
use pom::parser::*;
use pom::parser::Parser;

#[derive(Debug, PartialEq)]
pub enum SynTree<'a> {
    N(String), // Name 
    P(&'a str, &'a str), // Property
    L(&'a str, Vec<SynTree<'a>>), // List
}

type Prs<'a> = Parser<'a, u8, SynTree<'a>>;

fn space<'a>() -> Parser<'a, u8, ()> {
    one_of(b" \t\r\n").repeat(0..).discard()
}

fn word<'a>() -> Prs<'a> {
    one_of( "pbtdkg'fvţḑszšžxhļcżčjmnňrlwyřaeouiäëöüàèòùìáéóúíâêôûî".as_bytes() ).repeat(1..).convert(String::from_utf8).map(SynTree::N)
}

fn wordb<'a>() -> Parser<'a, u8, String> {
    one_of( "pbtdkg'fvţḑszšžxhļcżčjmnňrlwyřaeouiäëöüàèòùìáéóúíâêôûî".as_bytes() ).repeat(1..).convert(String::from_utf8)
}

fn object<'a>() -> Prs<'a> {
    let members = list(call(value) , sym(b','));
    let obj = sym(b'(') * space() * members - space() - sym(b')');
    obj.map(|members| {
        SynTree::L("object", members.into_iter().collect::<Vec<_>>())
    })
}

fn value<'a>() -> Prs<'a> {
    word() | object()
}

// fn root<'a>() -> Prs<'a> {

// }

fn main() {
    // let expr = std::env::args().skip(1).fold("".to_string(), |acc, x| acc+" "+&x);
    // let input = expr.as_bytes();
    // let output = root().parse(input);
    // println!("{:?}", output);

    let word = one_of( "pbtdkg'fvţḑszšžxhļcżčjmnňrlwyřaeouiäëöüàèòùìáéóúíâêôûî".as_bytes() ).repeat(1..).convert(String::from_utf8).map(SynTree::N);

    let sentence = space() * list(word , space()) - space();
    let text = space() * list(sentence, sym(b'.')) - space();


    match std::env::args().nth(1) {
        Some(expr) => {
            let root = text - end();
            let input = expr.as_bytes();
            let output = root.parse(input);
            println!("{:?}", output);
        },
        None => (),
    }
}


