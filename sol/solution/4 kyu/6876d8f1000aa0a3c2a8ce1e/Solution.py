#
# Solution
#
def faro(n: int) -> int:
    if n % 2 != 0:
        return 0
    if n == 2:
        return 1
    m = n - 1
    if m == 1:
        return 1
    import random
    import math
    def is_prime(n: int) -> bool:
        if n < 2:
            return False
        small_primes = (2, 3, 5, 7, 11, 13, 17, 19, 23, 29)
        for p in small_primes:
            if n % p == 0:
                return n == p
        d = n - 1
        s = 0
        while d % 2 == 0:
            d //= 2
            s += 1
        for a in (2, 325, 9375, 28178, 450775, 9780504, 1795265022):
            if a % n == 0:
                continue
            x = pow(a, d, n)
            if x == 1 or x == n - 1:
                continue
            for _ in range(s - 1):
                x = (x * x) % n
                if x == n - 1:
                    break
            else:
                return False
        return True
    def pollards_rho(n: int) -> int:
        if n % 2 == 0:
            return 2
        if is_prime(n):
            return n
        while True:
            c = random.randrange(1, n - 1)
            x = random.randrange(2, n - 1)
            y = x
            d = 1
            while d == 1:
                x = (x * x + c) % n
                y = (y * y + c) % n
                y = (y * y + c) % n
                d = math.gcd(abs(x - y), n)
                if d == n:
                    break
            if d > 1 and d < n:
                return d
    def factorize(x: int) -> dict:
        fac: dict = {}
        def _factor(n: int) -> None:
            if n == 1:
                return
            if is_prime(n):
                fac[n] = fac.get(n, 0) + 1
                return
            d = pollards_rho(n)
            if d == n:
                dd = 2
                while dd * dd <= n:
                    while n % dd == 0:
                        fac[dd] = fac.get(dd, 0) + 1
                        n //= dd
                    dd += 1 if dd == 2 else 2
                if n > 1:
                    fac[n] = fac.get(n, 0) + 1
            else:
                _factor(d)
                _factor(n // d)
        _factor(x)
        return fac
    fac_m = factorize(m)
    phi = m
    for p in fac_m:
        phi = phi // p * (p - 1)
    fac_phi = factorize(phi)
    order = phi
    for p in fac_phi:
        while order % p == 0 and pow(2, order // p, m) == 1:
            order //= p
    return order





#
# Sample Tests
#
from solution import faro
import codewars_test as test

tests = [
    (2, 1), (4, 2), (6, 4), (8, 3), (14, 12), (16, 4), (30, 28), (40, 12), (96, 36), (98, 48)
]

@test.describe("Fixed Tests")
def _() -> None:

    @test.it("Sample Tests")
    def _() -> None:
    
        for n, expected in tests:

            user = faro(n)
            test.expect(user == expected, f"Testing {n=}; {user} should equal {expected}.")
