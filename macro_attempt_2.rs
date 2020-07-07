
// trace_macros!(true);

// macro_rules! destress {
//     ($i:ident) =>
//     (
//         let i = stringify!($i);
//         match i.len() {
//           1 =>
//           2 => {
//             let chars = i.chars();
//             let f = chars.next();
//             let s = chars.next();
//             if s == 'u' || s == 'i' {
//                 let i =
//             }
//             else {

//             }
//           }
//           _ => panic!("{:?}", line!());
//         }
//     )
// }


macro_rules! p {
    ($a:ident, $b:ident) =>
    (
        $a$b
    );
}



const fn destress(i: &'static str) -> () {
    match i.len() {
        1 => alt(( p!(stressed_, a), p!(unstressed_, a) )),
        _ => unimplemented!(),
    }
}

macro_rules! destress {
    ($i:ident) =>
    (
        const $i = destress(stringify!($i));
    )
}


let unstressed_a = tag("a");
let unstressed_ä = tag("ä");

let stressed_a = tag("á");
let stressed_ä = tag("â");



    // alt!( serie1 = [a,ä] );


    let serie1 = destress!(a);