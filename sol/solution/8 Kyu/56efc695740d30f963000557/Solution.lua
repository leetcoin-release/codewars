--[[
Solution
]]
local function to_alternating_case(s)
  local result = {}
  for i = 1, #s do
    local c = s:sub(i, i)
    if c:match("%l") then
      table.insert(result, c:upper())
    elseif c:match("%u") then
      table.insert(result, c:lower())
    else
      table.insert(result, c)
    end
  end
  return table.concat(result)
end
return to_alternating_case





--[[
Sample Tests
]]
local to_alternating_case = require "solution"

describe("Basic tests", function()
  it("should work for fixed tests (provided in the description)", function()
    assert.are.same("HELLO WORLD", to_alternating_case "hello world", 'to_alternating_case "hello world"')
    assert.are.same("hello world", to_alternating_case "HELLO WORLD", 'to_alternating_case "HELLO WORLD"')
    assert.are.same("HELLO world", to_alternating_case "hello WORLD", 'to_alternating_case "hello WORLD"')
    assert.are.same("hEllO wOrld", to_alternating_case "HeLLo WoRLD", 'to_alternating_case "HeLLo WoRLD"')
    assert.are.same("12345", to_alternating_case "12345", 'to_alternating_case "12345"')
    assert.are.same("1A2B3C4D5E", to_alternating_case "1a2b3c4d5e", 'to_alternating_case "1a2b3c4d5e"')
    assert.are.same("sTRING.PROTOTYPE.TOaLTERNATINGcASE", to_alternating_case "String.prototype.toAlternatingCase", 'to_alternating_case "String.prototype.toAlternatingCase"')
    assert.are.same("Hello World", to_alternating_case(to_alternating_case "Hello World"), 'to_alternating_case(to_alternating_case "Hello World")')
  end)

  it("should work for the title of this Kata", function()
    local title = "altERnaTIng cAsE"
    title = to_alternating_case(title)
    assert.are.same("ALTerNAtiNG CaSe", title, 'to_alternating_case "altERnaTIng cAsE"')
    title = to_alternating_case(title)
    assert.are.same("altERnaTIng cAsE", title, 'to_alternating_case "ALTerNAtiNG CaSe"')
    title = to_alternating_case(title)
    assert.are.same("ALTerNAtiNG CaSe", title, 'to_alternating_case "altERnaTIng cAsE"')
    title = to_alternating_case(title)
    assert.are.same("altERnaTIng cAsE", title, 'to_alternating_case "ALTerNAtiNG CaSe"')
    local title = "altERnaTIng cAsE <=> ALTerNAtiNG CaSe"
    title = to_alternating_case(title)
    assert.are.same("ALTerNAtiNG CaSe <=> altERnaTIng cAsE", title, 'to_alternating_case "altERnaTIng cAsE <=> ALTerNAtiNG CaSe"')
    title = to_alternating_case(title)
    assert.are.same("altERnaTIng cAsE <=> ALTerNAtiNG CaSe", title, 'to_alternating_case "ALTerNAtiNG CaSe <=> altERnaTIng cAsE"')
    title = to_alternating_case(title)
    assert.are.same("ALTerNAtiNG CaSe <=> altERnaTIng cAsE", title, 'to_alternating_case "altERnaTIng cAsE <=> ALTerNAtiNG CaSe"')
    title = to_alternating_case(title)
    assert.are.same("altERnaTIng cAsE <=> ALTerNAtiNG CaSe", title, 'to_alternating_case "ALTerNAtiNG CaSe <=> altERnaTIng cAsE"')
  end)
end)