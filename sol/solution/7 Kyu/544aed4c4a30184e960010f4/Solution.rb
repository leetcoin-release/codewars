=begin
Solution
=end
def divisors(n)
  result = (2...n).select { |i| n % i == 0 }
  result.empty? ? "#{n} is prime" : result
end





=begin
Sample Tests
=end
describe "Tests" do
    def do_test(n, expected)
        actual = divisors(n)
        message = "for n = #{n} expected #{expected.inspect} but got #{actual.inspect}"
        expect(actual).to eq(expected), message
    end

    it "Sample tests" do
      do_test(2, "2 is prime")
      do_test(3, "3 is prime")
      do_test(4, [2])
      do_test(5, "5 is prime")
      do_test(6, [2, 3])
      do_test(7, "7 is prime")
      do_test(8, [2, 4])
      do_test(9, [3])
      do_test(10, [2, 5])
    end
end