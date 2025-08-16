#
# Solution
#
def solve(a, b):
    seq = []
    primes = []
    n = 2
    while len(seq) < a + b:
        if is_prime(n, primes):
            primes.append(n)
            seq.extend(str(n))
        n += 1
    return ''.join(seq[a:a+b])
def is_prime(n, primes):
    if n < 2:
        return False
    limit = int(n**0.5)
    for p in primes:
        if p > limit:
            break
        if n % p == 0:
            return False
    return True





#
# Sample Tests
#
import codewars_test as test
from solution import solve

@test.describe("Fixed Tests")
def fixed_tests():
    @test.it('Basic Test Cases')
    def basic_test_cases():
        test.assert_equals(solve(2,2),'57')
        test.assert_equals(solve(10,3),'192')
        test.assert_equals(solve(20,9),'414347535')
        test.assert_equals(solve(30,12),'616771737983')
        test.assert_equals(solve(40,8),'83899710')
        test.assert_equals(solve(50,6),'031071')
        test.assert_equals(solve(10000,5),'02192')
        test.assert_equals(solve(20000,5),'09334')