# [**Repeating Faro Shuffle**](https://www.codewars.com/kata/6876d8f1000aa0a3c2a8ce1e)

## **Description:**

### **Previous Kata**
This kata is a harder version of [This Kata](https://www.codewars.com/kata/57bc802c615f0ba1e3000029). Be sure to check that one out first.

### **Faro Shuffle**
A [Faro Shuffle](https://en.wikipedia.org/wiki/Faro_shuffle) is a way of shuffling a deck of cards. It can be performed in two ways: in-shuffle and out-shuffle. For this kata, we will only consider the out-shuffle.

An out-shuffle is performed by splitting the deck into two equal halves and then interleaving the cards from each half, starting with the top card of the first half. For example, if we have a deck of `8` cards numbered from `1` to `8`, the out-shuffle would look like this:

```md
1 2 3 4 5 6 7 8 ->
1 5 2 6 3 7 4 8 ->
1 3 5 7 2 4 6 8 ->
1 2 3 4 5 6 7 8
```

Notice that after `3` shuffles, the deck returns to its original order. This is a property of the out-shuffle, for a standard deck of `52` cards, it takes `8` shuffles to return to the original order.

### **Task**
Given the size of a deck of cards `n`, return the minimum number of out-shuffles required to return the deck to its original order. Consider that the deck is numbered from `1` to `n` and that `n` is a **positive even number**.

A brute force solution with `O(n)` or worse complexity will not pass. You are expected to handle large values of n efficiently. More information about the tests will be provided in the Solution Setup.

### **Examples**

```md
# (1 2 -> 1 2)
2 -> 1 

# (1 2 3 4 -> 1 3 2 4 -> 1 2 3 4)
4 -> 2 

# (1 2 3 4 5 6 -> 1 4 2 5 3 6 -> 1 5 4 3 2 6 -> 1 3 5 2 4 6 -> 1 2 3 4 5 6)
6 -> 4

10 ** 14 -> 2565451980
```

## **Solutions:**

#### **Python**
```py
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
```