// #![feature(non_ascii_idents)]

#[macro_use] extern crate lalrpop_util;
lalrpop_mod!(pub grammar); // synthesized by LALRPOP

pub mod ast;




fn main() {
    match std::env::args().nth(1) {
        Some(data) => match grammar::TextParser::new().parse(&data) {
            Ok(o) => println!("{}", o),
            Err(e) => println!("{}", e),
        }
        None => println!("give me some input!"),
    }
}

// let expr = std::env::args().skip(1).fold("".to_string(), |acc, x| acc+" "+&x);
// let input = expr.as_bytes();
// let output = root().parse(input);
// println!("{:?}", output);


