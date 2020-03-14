use std::fs::File;
use std::io::Write;
use tempfile::Builder;

fn main() {
    println!("running main: {}", calculate(40));
    let mut fp = File::create("/home/circleci/circleci_temp.txt").unwrap();
    let tfp = Builder::new()
        .prefix("circleci_temp")
        .suffix(".txt")
        .tempfile()
        .unwrap();
    let x = calculate(2);
    println!("fname is: {:?}", tfp.path());
    writeln!(fp, "I calculated the answer to be: {}", x).unwrap();
}

#[allow(dead_code)]
fn calculate(i: isize) -> isize {
    i + 40
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn adds_test() {
        assert_eq!(42, calculate(2));
    }
}
