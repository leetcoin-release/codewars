/*
Solution
*/
fn divisors(integer: u32) -> Result<Vec<u32>, String> {
    let mut result = Vec::new();
    for i in 2..integer {
        if integer % i == 0 {
            result.push(i);
        }
    }
    if result.is_empty() {
        Err(format!("{} is prime", integer))
    } else {
        Ok(result)
    }
}





/*
Sample Tests
*/
#[cfg(test)]
mod tests {
    use super::divisors;

    fn do_test(number: u32, expected: Result<Vec<u32>, String>) {
        let actual = divisors(number);
        assert_eq!(actual, expected, "\ndivisors({number:?}): Your result (left) does not match the expected output (right)");
    }
    
    mod sample_tests {
        use super::*;

        #[test]
        fn test_15() {
	        do_test(15, Ok(vec![3,5]));
        }
        #[test]
        fn test_24() {
	        do_test(24, Ok(vec![2,3,4,6,8,12]));
        }
        #[test]
        fn test_25() {
	        do_test(25, Ok(vec![5]));
        }
        #[test]
        fn test_13() {
	        do_test(13, Err("13 is prime".into()));
        }
    }
}
