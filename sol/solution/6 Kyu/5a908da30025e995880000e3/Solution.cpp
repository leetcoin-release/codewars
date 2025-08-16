/*
Solution
*/
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





/*
Sample Tests
*/
Describe(Sample_Test)
{
    It(Basic_Tests)
    {
        doTest(    2,  2, "57");
        doTest(   10,  3, "192");
        doTest(   20,  9, "414347535");
        doTest(   30, 12, "616771737983");
        doTest(   40,  8, "83899710");
        doTest(   50,  6, "031071");
        doTest(10000,  5, "02192");
        doTest(20000,  5, "09334");
    }
    void doTest(int a, int b, const std::string &expected)
    {
        Assert::That(solve(a, b), Equals(expected));
    }
};