#![feature(non_ascii_idents)]
#![feature(trace_macros)]
#![type_length_limit="1341423"]

extern crate jemallocator;
extern crate nom;

#[global_allocator]
static ALLOC: jemallocator::Jemalloc = jemallocator::Jemalloc;

use nom::{
    branch::*, bytes::complete::*, character::complete::*, combinator::*, error::*, multi::*, sequence::*, IResult,
};

use std::fmt;

#[derive(Debug, PartialEq)]
pub enum SynTree<'a> {
    N(&'a str),                   // Name
    S(String),                    // String Name
    P(String, String),          // Property
    L(String, Vec<SynTree<'a>>), // List
}

impl<'a> fmt::Display for SynTree<'a> {
    fn fmt(&self, formatter: &mut fmt::Formatter<'_>) -> fmt::Result {
        aux_fmt(self, formatter, 0)
    }
}

fn aux_fmt(syntree: &SynTree, formatter: &mut fmt::Formatter<'_>, depth: usize) -> fmt::Result {
    match syntree {
        SynTree::N(syntree) => writeln!(formatter, "├{} {}", "─".repeat(depth), syntree),
        SynTree::S(syntree) => writeln!(formatter, "├{} {}", "─".repeat(depth), syntree),
        SynTree::P(key, value) => writeln!(formatter, "├{} {}: {}", "─".repeat(depth), key, value),
        SynTree::L(key, value) => {
            writeln!(formatter, "├{} {}", "─".repeat(depth), key)?;
            for input in value {
                aux_fmt(input, formatter, depth + 1)?;
            }
            Ok(())
        }
    }
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
        let $i = map($e, |x| SynTree::P(stringify!($i).to_string(),x));
        grammar!($($tail)*);
    );
    (let $i:ident L= $e:expr; $($tail:tt)*) =>
    (
        let $i = map($e, |x| SynTree::L(stringify!($i).to_string(),x));
        grammar!($($tail)*);
    );
    ($e:stmt; $($tail:tt)*) =>
    (
        $e
        grammar!($($tail)*);
    );
}

macro_rules! surrounded {
    ($x:expr, $syntree:expr) => {
        terminated(preceded($syntree, $x), $syntree)
    };
}

// macro_rules! pair_then_concat {
//     ($a:expr,$b:expr) => {
//         map(pair($a, $b), |(x, y): (&str, &str)| (&[x, y]).concat())
//     };
// }

fn sp<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, (), E> {
    let char = " \t\r\n";
    // map(take_while(move |c| " ".contains(c)), |_| () )(input) //
    map(many1(one_of(char)), |_| ())(input)
}

fn sp_around_stop<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, (), E> {
    map(surrounded!(stop, opt(sp)), |_| ())(input)
}

fn stop<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, char, E> {
    char('.')(input)
}



fn glottal<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("’"), String::from) (input) }

fn unstressed_a<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("a"), String::from) (input) }
fn unstressed_ä<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("ä"), String::from) (input) }
fn unstressed_e<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("e"), String::from) (input) }
fn unstressed_ë<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("ë"), String::from) (input) }
fn unstressed_i<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("i"), String::from) (input) }
fn unstressed_ö<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("ö"), String::from) (input) }
fn unstressed_o<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("o"), String::from) (input) }
fn unstressed_ü<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("ü"), String::from) (input) }
fn unstressed_u<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("u"), String::from) (input) }

fn stressed_a<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("á"), String::from) (input) }
fn stressed_ä<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("â"), String::from) (input) }
fn stressed_e<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("é"), String::from) (input) }
fn stressed_ë<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("ê"), String::from) (input) }
fn stressed_i<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("í"), String::from) (input) }
fn stressed_ö<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("ô"), String::from) (input) }
fn stressed_o<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("ó"), String::from) (input) }
fn stressed_ü<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("û"), String::from) (input) }
fn stressed_u<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("ú"), String::from) (input) }

fn a<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(alt((stressed_a,unstressed_a)), String::from) (input) }
fn ä<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(alt((stressed_ä,unstressed_ä)), String::from) (input) }
fn e<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(alt((stressed_e,unstressed_e)), String::from) (input) }
fn ë<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(alt((stressed_ë,unstressed_ë)), String::from) (input) }
fn i<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(alt((stressed_i,unstressed_i, map(tag("ì"), String::from) )), String::from) (input) }
fn ö<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(alt((stressed_ö,unstressed_ö)), String::from) (input) }
fn o<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(alt((stressed_o,unstressed_o)), String::from) (input) }
fn ü<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(alt((stressed_ü,unstressed_ü)), String::from) (input) }
fn u<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(alt((stressed_u,unstressed_u)), String::from) (input) }

fn unstressed_ai<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("ai"), String::from) (input) }
fn unstressed_au<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("au"), String::from) (input) }
fn unstressed_ei<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("ei"), String::from) (input) }
fn unstressed_eu<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("eu"), String::from) (input) }
fn unstressed_ëi<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("ëi"), String::from) (input) }
fn unstressed_ou<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("ou"), String::from) (input) }
fn unstressed_oi<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("oi"), String::from) (input) }
fn unstressed_iu<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("iu"), String::from) (input) }
fn unstressed_ui<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("ui"), String::from) (input) }

fn stressed_ai<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("ái"), String::from) (input) }
fn stressed_au<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("áu"), String::from) (input) }
fn stressed_ei<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("éi"), String::from) (input) }
fn stressed_eu<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("éu"), String::from) (input) }
fn stressed_ëi<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("êi"), String::from) (input) }
fn stressed_ou<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("óu"), String::from) (input) }
fn stressed_oi<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("ói"), String::from) (input) }
fn stressed_iu<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("íu"), String::from) (input) }
fn stressed_ui<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tag("úi"), String::from) (input) }

fn ai<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(alt((stressed_ai, unstressed_ai)), String::from) (input) }
fn au<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(alt((stressed_au, unstressed_au)), String::from) (input) }
fn ei<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(alt((stressed_ei, unstressed_ei)), String::from) (input) }
fn eu<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(alt((stressed_eu, unstressed_eu)), String::from) (input) }
fn ëi<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(alt((stressed_ëi, unstressed_ëi)), String::from) (input) }
fn ou<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(alt((stressed_ou, unstressed_ou)), String::from) (input) }
fn oi<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(alt((stressed_oi, unstressed_oi)), String::from) (input) }
fn iu<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(alt((stressed_iu, unstressed_iu)), String::from) (input) }
fn ui<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(alt((stressed_ui, unstressed_ui)), String::from) (input) }


fn serie1<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { alt((a, ä, e, ë, i, ö, o, ü, u))(input) }
fn serie2<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { alt((ai, au, ei, eu, ëi, ou, oi, iu, ui))(input) }

fn ia<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tuple((i, a)), |(x,y)| [x,y].concat()) (input) }
fn oä<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tuple((o, ä)), |(x,y)| [x,y].concat()) (input) }
fn iä<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tuple((i, ä)), |(x,y)| [x,y].concat()) (input) }
fn uä<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tuple((u, ä)), |(x,y)| [x,y].concat()) (input) }
fn ie<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tuple((i, e)), |(x,y)| [x,y].concat()) (input) }
fn oë<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tuple((o, ë)), |(x,y)| [x,y].concat()) (input) }
fn ië<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tuple((i, ë)), |(x,y)| [x,y].concat()) (input) }
fn uë<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tuple((u, ë)), |(x,y)| [x,y].concat()) (input) }
fn ëu<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tuple((ë, u)), |(x,y)| [x,y].concat()) (input) }
fn uö<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tuple((u, ö)), |(x,y)| [x,y].concat()) (input) }
fn iö<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tuple((i, ö)), |(x,y)| [x,y].concat()) (input) }
fn uo<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tuple((u, o)), |(x,y)| [x,y].concat()) (input) }
fn io<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tuple((i, o)), |(x,y)| [x,y].concat()) (input) }
fn ue<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tuple((u, e)), |(x,y)| [x,y].concat()) (input) }
fn eö<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tuple((e, ö)), |(x,y)| [x,y].concat()) (input) }
fn ua<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tuple((u, a)), |(x,y)| [x,y].concat()) (input) }
fn aö<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { map(tuple((a, ö)), |(x,y)| [x,y].concat()) (input) }

fn serie3<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { alt(( alt((ia,oä)), alt((iä,uä)), alt((ie,oë)), alt((ië,uë)), ëu, alt((uö,iö)), alt((uo,io)), alt((ue,eö)), alt((ua,aö)) ))(input) }
// fn serie3<'a, E: ParseError<&'a str>>(input: &'a str) -> IResult<&'a str, String, E> { alt(( alt((ia,oä)) ))(input) }


fn root<'a, E: ParseError<&'a str> + ContextError<&'a str>>(
    input: &'a str,
) -> IResult<&'a str, SynTree, E> {


grammar! {

let word S= alt(( serie1, serie2, serie3 ));
let sentence L= separated_list1(sp, word);
let text L= separated_list1(sp_around_stop, sentence);

};

    all_consuming(delimited(opt(sp), text, opt(sp_around_stop))) (input)
}

fn main() {
    match std::env::args().nth(1) {
        Some(data) => match root::<(&str, ErrorKind)>(&*data) {
            Ok((input, output)) => print!("Remaining:\n{}\nOk:\n{}\n", input, output),
            Err(err) => println!("Err:\n{}\n", err),
        },
        None => println!("give me some input!"),
    }
}
// let expr = std::env::args().skip(1).fold("".to_string(), |acc, x| acc+" "+&x);
// let input = expr.as_bytes();
// let output = root().parse(input);
// println!("{:?}", output);
