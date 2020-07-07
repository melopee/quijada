// #![cfg(feature = "alloc")]

extern crate jemallocator;
extern crate nom;

#[global_allocator]
static ALLOC: jemallocator::Jemalloc = jemallocator::Jemalloc;

use nom::{
  branch::*,
  bytes::complete::*,
  character::complete::*,
  combinator::*,
  error::*,
  multi::*,
  number::complete::*,
  sequence::*,
  Err, IResult,
};

use std::fmt;

#[derive(Debug, PartialEq)]
pub enum SynTree<'a> {
    N(&'a str), // Name 
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

fn sp<'a, E: ParseError<&'a str>>(i: &'a str) -> IResult<&'a str, (), E> {
  let char = " \t\r\n";
  // map(take_while(move |c| " ".contains(c)), |_| () )(i) //
  map(many1(one_of(char)), |_| () )(i)
}

macro_rules! grammar_rule {
    (let $i:ident N= $e:expr) => ( let $i = map($e, SynTree::N); );
    (let $i:ident P= $e:expr) => ( let $i = map($e, |x| SynTree::P(stringify!($i),x)); );
    (let $i:ident L= $e:expr) => ( let $i = map($e, |x| SynTree::L(stringify!($i),x)); );
}

macro_rules! surrounded {
  ($x:expr, $s:expr) => ( terminated(preceded($s, $x), $s) );
}


fn root<'a, E: ParseError<&'a str> + ContextError<&'a str>>(
  i: &'a str,
) -> IResult<&'a str, SynTree, E> {

  grammar_rule!( let word N= tag("a") );
  grammar_rule!( let sentence L= separated_list0(sp, word) );
  // let spopt = || opt(sp);
  // grammar_rule!( let text L= separated_list0(surrounded!(char('.'), spopt()), sentence) );

  delimited(
    opt(sp),
    sentence,
    tag("b"),
  )(i)
}



fn main() {
    match std::env::args().nth(1) {
        Some(data) => {
            match root::<(&str, ErrorKind)>(&*data) {
                Ok((i, o)) => print!("Remaining:\n{}\nOk:\n{:?}", i, o),
                Err(e) => println!("Err:\n{}", e),
            }
        },
        None => println!("give me some input!"),
    }
}

