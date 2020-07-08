// #[derive(Debug)]
// pub enum Expr {
//     Number(i32),
//     Op(Box<Expr>, Opcode, Box<Expr>),
// }

// #[derive(Debug)]
// pub enum Opcode {
//     Mul,
//     Div,
//     Add,
//     Sub,
// }

use std::fmt;



#[derive(Debug, PartialEq)]
pub enum SynTree {
    N(String),               // Name
    P(String, String),       // Property
    L(String, Vec<SynTree>), // List
}

impl fmt::Display for SynTree {
    fn fmt(&self, formatter: &mut fmt::Formatter<'_>) -> fmt::Result {
        aux_fmt(self, formatter, 0, false)
    }
}

fn aux_fmt(syntree: &SynTree, formatter: &mut fmt::Formatter<'_>, depth: usize, last: bool) -> fmt::Result {
    let decender = if last { "└" } else { "├" }; 
    match syntree {
        SynTree::N(syntree) => writeln!(formatter, "{}{} {}", decender, "─".repeat(depth), syntree),
        SynTree::P(key, value) => writeln!(formatter, "{}{} {}: {}", decender, "─".repeat(depth), key, value),
        SynTree::L(key, value) => {
            writeln!(formatter, "{}{} {}", decender, "─".repeat(depth), key)?;
            let mut i = 0;
            let len = value.len();
            for input in value {
                i+=1;
                aux_fmt(input, formatter, depth + 1, if i == len { true } else { false } )?;
            }
            Ok(())
        }
    }
}



// #[derive(Debug, PartialEq)]
// pub enum SynTree<'a> {
//     N(&'a str),                   // Name
//     P(&'a str, &'a str),          // Property
//     L(&'a str, Vec<SynTree<'a>>), // List
// }

// impl<'a> fmt::Display for SynTree<'a> {
//     fn fmt(&self, formatter: &mut fmt::Formatter<'_>) -> fmt::Result {
//         aux_fmt(self, formatter, 0)
//     }
// }

// fn aux_fmt(syntree: &SynTree, formatter: &mut fmt::Formatter<'_>, depth: usize) -> fmt::Result {
//     match syntree {
//         SynTree::N(syntree) => writeln!(formatter, "├{} {}", "─".repeat(depth), syntree),
//         SynTree::P(key, value) => writeln!(formatter, "├{} {}: {}", "─".repeat(depth), key, value),
//         SynTree::L(key, value) => {
//             writeln!(formatter, "├{} {}", "─".repeat(depth), key)?;
//             for input in value {
//                 aux_fmt(input, formatter, depth + 1)?;
//             }
//             Ok(())
//         }
//     }
// }