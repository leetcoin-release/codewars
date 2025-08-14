--[[
Solution
]]
local function divisors(integer)
  local result = {}
  for i = 2, integer - 1 do
    if integer % i == 0 then
      table.insert(result, i)
    end
  end
  if #result == 0 then
    return integer .. " is prime"
  else
    return result
  end
end
return divisors





--[[
Sample Tests
]]--
local divisors = require "solution"

describe("Fixed Tests", function()
  it("Basic Test Cases", function()
    assert.are.same({ 3, 5 }, divisors(15), "divisors(15)")
    assert.are.same({ 11, 23 }, divisors(253), "divisors(253)")
    assert.are.same({ 2, 3, 4, 6, 8, 12 }, divisors(24), "divisors(24)")
    assert.are.same({ 5 }, divisors(25), "divisors(25)")
    assert.are.same("13 is prime", divisors(13), "divisors(13)")
    assert.are.same("3 is prime", divisors(3), "divisors(3)")
    assert.are.same("29 is prime", divisors(29), "divisors(29)")
  end)
end)