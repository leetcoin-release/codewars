/*
Solution
*/
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





/*
Sample Tests
*/
#include <criterion/criterion.h>
#include <stdlib.h>

char *solve(int a, int b);

static void do_test(int a, int b, const char *expected);

Test(sample_test, basic_tests)
{
    do_test(    2,  2, "57");
    do_test(   10,  3, "192");
    do_test(   20,  9, "414347535");
    do_test(   30, 12, "616771737983");
    do_test(   40,  8, "83899710");
    do_test(   50,  6, "031071");
    do_test(10000,  5, "02192");
    do_test(20000,  5, "09334");
}

static void do_test(int a, int b, const char *expected)
{
    char *actual = solve(a, b);
    cr_assert_str_eq(actual, expected,
        "a = %d, b = %d\nExpected \"%s\"\nReceived \"%s\"",
        a, b, expected, actual);
    free(actual);
}