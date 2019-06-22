fn main() {
    println!("running main: {}", calculate(40));
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
