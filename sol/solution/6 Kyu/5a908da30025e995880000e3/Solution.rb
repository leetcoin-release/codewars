=begin
Solution
=end
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





=begin
Sample Tests
=end
describe "Simple primes streaming" do
  it "Basic tests" do    
    Test.assert_equals(solve(2,2),'57')
    Test.assert_equals(solve(10,3),'192')
    Test.assert_equals(solve(20,9),'414347535')
    Test.assert_equals(solve(30,12),'616771737983')
    Test.assert_equals(solve(40,8),'83899710')
    Test.assert_equals(solve(50,6),'031071')
    Test.assert_equals(solve(10000,5),'02192')
    Test.assert_equals(solve(20000,5),'09334')
  end 
end