#=
Solution
=#
function to_alternating_case(string)
    join([isuppercase(c) ? lowercase(c) : islowercase(c) ? uppercase(c) : c for c in string])
end





#=
Sample Tests
=#
using FactCheck

facts("Basic tests") do
  context("should work for fixed tests (provided in the description)") do
    @fact to_alternating_case("hello world") --> "HELLO WORLD"
    @fact to_alternating_case("HELLO WORLD") --> "hello world"
    @fact to_alternating_case("hello WORLD") --> "HELLO world"
    @fact to_alternating_case("HeLLo WoRLD") --> "hEllO wOrld"
    @fact to_alternating_case("12345") --> "12345"
    @fact to_alternating_case("1a2b3c4d5e") --> "1A2B3C4D5E"
    @fact to_alternating_case("String.prototype.toAlternatingCase") --> "sTRING.PROTOTYPE.TOaLTERNATINGcASE"
    @fact to_alternating_case(to_alternating_case("Hello World")) --> "Hello World"   
  end
  
  context("should work for fixed tests (provided in the description)") do
    @fact to_alternating_case("altERnaTIng cAsE") --> "ALTerNAtiNG CaSe"
    @fact to_alternating_case("ALTerNAtiNG CaSe") --> "altERnaTIng cAsE"
    @fact to_alternating_case("altERnaTIng cAsE <=> ALTerNAtiNG CaSe") --> "ALTerNAtiNG CaSe <=> altERnaTIng cAsE"
    @fact to_alternating_case("ALTerNAtiNG CaSe <=> altERnaTIng cAsE") --> "altERnaTIng cAsE <=> ALTerNAtiNG CaSe"
  end
end