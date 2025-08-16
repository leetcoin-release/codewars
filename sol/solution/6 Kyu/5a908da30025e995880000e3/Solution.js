/*
Solution
*/
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





/*
Sample Tests
*/
describe("Basic tests", function(){
Test.assertEquals(solve(2,2),'57');
Test.assertEquals(solve(10,3),'192');
Test.assertEquals(solve(20,9),'414347535');
Test.assertEquals(solve(30,12),'616771737983');
Test.assertEquals(solve(40,8),'83899710');
Test.assertEquals(solve(50,6),'031071');
Test.assertEquals(solve(10000,5),'02192');
Test.assertEquals(solve(20000,5),'09334');
});