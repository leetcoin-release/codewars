#
# Solution
#
defmodule FindTheDivisors do
  def divisors(integer) when integer <= 2 do
    "#{integer} is prime"
  end
  def divisors(integer) do
    divs = for x <- 2..(integer - 1), rem(integer, x) == 0, do: x
    if divs == [] do
      "#{integer} is prime"
    else
      divs
    end
  end
end





#
# Sample Tests
#
defmodule TestFindTheDivisors do
  use ExUnit.Case
  import FindTheDivisors, only: [divisors: 1]

  test "example tests" do
    assert divisors(15) == [3, 5]
    assert divisors(12) == [2, 3, 4, 6]
    assert divisors(13) == "13 is prime"
  end
end