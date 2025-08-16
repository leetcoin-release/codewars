# [**Simple prime streaming**](https://www.codewars.com/kata/5a908da30025e995880000e3)

## **Description:**

Consider a sequence made up of the consecutive prime numbers. This infinite sequence would start with:

```md
"2357111317192329313741434753596167717379..."
```

You will be given two numbers: `a` and `b`, and your task will be to return `b` elements starting from index `a` in this sequence.

```md
For example:
solve(10,5) == `19232` Because these are 5 elements from index 10 in the sequence.
```
Tests go up to about index 20000.

More examples in test cases. Good luck!

Please also try [**Simple time difference**](https://www.codewars.com/kata/5b76a34ff71e5de9db0000f2)

## **Solutions:**

#### **C**
```c
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <math.h>
char *solve(int a, int b) {
    int target = a + b;
    size_t cap = 1024;
    char *buf = (char *)malloc(cap);
    size_t len = 0;
    int primes_cap = 1024;
    int *primes = (int *)malloc(primes_cap * sizeof(int));
    int primes_cnt = 0;
    for (int n = 2; (int)len < target; n += (n == 2) ? 1 : 2) {
        int is_prime = 1;
        int limit = (int)sqrt((double)n);
        for (int i = 0; i < primes_cnt && primes[i] <= limit; ++i) {
            if (n % primes[i] == 0) {
                is_prime = 0;
                break;
            }
        }
        if (!is_prime) continue;
        if (primes_cnt == primes_cap) {
            primes_cap <<= 1;
            primes = (int *)realloc(primes, primes_cap * sizeof(int));
        }
        primes[primes_cnt++] = n;
        char tmp[16];
        int w = snprintf(tmp, sizeof tmp, "%d", n);
        if (len + (size_t)w + 1 > cap) {
            while (len + (size_t)w + 1 > cap) cap <<= 1;
            buf = (char *)realloc(buf, cap);
        }
        memcpy(buf + len, tmp, (size_t)w);
        len += (size_t)w;
    }
    char *out = (char *)malloc((size_t)b + 1);
    memcpy(out, buf + a, (size_t)b);
    out[b] = '\0';
    free(buf);
    free(primes);
    return out;
}
```

#### **Clojure**
```clj
(ns kata.core)
(defn prime? [n]
  (cond
    (< n 2) false
    (= n 2) true
    (even? n) false
    :else (let [limit (Math/sqrt n)]
            (not-any? #(zero? (mod n %))
                      (range 3 (inc (int limit)) 2)))))
(def prime-chars
  (mapcat seq (map str (filter prime? (iterate inc 2)))))
(defn solve [a b]
  (->> prime-chars
       (drop a)
       (take b)
       (apply str)))
```

#### **C++**
```cpp
#include <string>
#include <vector>
#include <cmath>
using namespace std;
bool isPrime(int n, const vector<int>& primes) {
    if (n < 2) return false;
    int limit = static_cast<int>(sqrt(n));
    for (int p : primes) {
        if (p > limit) break;
        if (n % p == 0) return false;
    }
    return true;
}
string solve(int a, int b) {
    string seq;
    seq.reserve(a + b + 100);
    vector<int> primes;
    for (int n = 2; (int)seq.size() < a + b; ++n) {
        if (isPrime(n, primes)) {
            primes.push_back(n);
            seq += to_string(n);
        }
    }
    return seq.substr(a, b);
}
```

#### **Haskell**
```hs
module SimplePrimeStream where
isPrime :: Int -> Bool
isPrime n
  | n < 2     = False
  | n == 2    = True
  | even n    = False
  | otherwise = null [ x | x <- [3,5..limit], n `mod` x == 0 ]
  where
    limit = floor . sqrt $ fromIntegral n
primes :: [Int]
primes = filter isPrime [2..]
primeStream :: String
primeStream = concatMap show primes
solve :: Int -> Int -> String
solve a b = take b . drop a $ primeStream
```

#### **Java**
```java
public class SimplePrimeStreaming {
    public static String solve(int a, int b) {
        StringBuilder sb = new StringBuilder(a + b + 100); // preallocate
        java.util.List<Integer> primes = new java.util.ArrayList<>();
        for (int n = 2; sb.length() < a + b; n++) {
            if (isPrime(n, primes)) {
                primes.add(n);
                sb.append(n);
            }
        }
        return sb.substring(a, a + b);
    }
    private static boolean isPrime(int n, java.util.List<Integer> primes) {
        if (n < 2) return false;
        int limit = (int) Math.sqrt(n);
        for (int p : primes) {
            if (p > limit) break;
            if (n % p == 0) return false;
        }
        return true;
    }
}
```

#### **JavaScript**
```js
function solve(a, b) {
  let primes = [];
  let seq = "";
  let n = 2;
  while (seq.length < a + b) {
    if (isPrime(n, primes)) {
      primes.push(n);
      seq += n.toString();
    }
    n++;
  }
  return seq.slice(a, a + b);
}
function isPrime(n, primes) {
  if (n < 2) return false;
  let limit = Math.sqrt(n);
  for (let p of primes) {
    if (p > limit) break;
    if (n % p === 0) return false;
  }
  return true;
}
```

#### **Python**
```py
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
```

#### **Ruby**
```rb
def solve(a, b)
  primes = []
  seq = +""
  n = 2
  while seq.length < a + b
    if prime?(n, primes)
      primes << n
      seq << n.to_s
    end
    n += 1
  end
  seq[a, b]
end
def prime?(n, primes)
  return false if n < 2
  limit = Math.sqrt(n).to_i
  primes.each do |p|
    break if p > limit
    return false if n % p == 0
  end
  true
end
```