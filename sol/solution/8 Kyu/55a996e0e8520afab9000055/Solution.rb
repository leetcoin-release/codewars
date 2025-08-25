=begin
Solution
=end
def cookie(x)
  if x.is_a?(String)
    name = "Zach"
  elsif x.is_a?(Integer) || x.is_a?(Float)
    name = "Monica"
  else
    name = "the dog"
  end
  "Who ate the last cookie? It was #{name}!"
end





=begin
Sample Tests
=end
Test.assert_equals(cookie("Ryan"), "Who ate the last cookie? It was Zach!")
Test.assert_equals(cookie(2.3), "Who ate the last cookie? It was Monica!")
Test.assert_equals(cookie(26), "Who ate the last cookie? It was Monica!")
Test.assert_equals(cookie(true), "Who ate the last cookie? It was the dog!")