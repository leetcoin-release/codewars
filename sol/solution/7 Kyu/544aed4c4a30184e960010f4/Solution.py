#
# Solution
#
def divisors(integer):
    result = [i for i in range(2, integer) if integer % i == 0]
    return result if result else f"{integer} is prime"





#
# Sample Tests
#
import codewars_test as test
from solution import divisors

@test.describe("Fixed Tests")
def basic_tests():
    @test.it('Basic Test Cases')
    def basic_test_cases():
        test.assert_equals(divisors(15), [3,5], "integer = 15")
        test.assert_equals(divisors(253), [11,23], "integer = 253")
        test.assert_equals(divisors(24), [2,3,4,6,8,12], "integer = 24")
        test.assert_equals(divisors(25), [5], "integer = 25")
        test.assert_equals(divisors(13), "13 is prime", "integer = 13")
        test.assert_equals(divisors(3), "3 is prime", "integer = 3")
        test.assert_equals(divisors(29), "29 is prime", "integer = 29")

