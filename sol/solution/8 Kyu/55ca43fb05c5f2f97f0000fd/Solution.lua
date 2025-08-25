--[[
Solution
]]
function list_animals(animals)
    local lst = ''
    for i = 1, #animals do
        lst = lst .. i .. '. ' .. animals[i] .. '\n'
    end
    return lst
end
return list_animals





--[[
Sample Tests
]]
local list_animals = require("solution");

describe("Testing", function()
    it("Sample Tests", function()
        local animals = { 'dog', 'cat', 'elephant' };
        tester(animals, '1. dog\n2. cat\n3. elephant\n');

        animals = { 'bird', 'parrot', 'elephant', 'giraffe' };
        tester(animals, '1. bird\n2. parrot\n3. elephant\n4. giraffe\n');

        animals = { 'pig', 'frog', 'hamster', 'mouse', 'sloth' };
        tester(animals, '1. pig\n2. frog\n3. hamster\n4. mouse\n5. sloth\n');

        animals = { 'cow', 'horse', 'pig', 'donkey', 'buffalo', 'turtle', 'chicken' };
        tester(animals, '1. cow\n2. horse\n3. pig\n4. donkey\n5. buffalo\n6. turtle\n7. chicken\n');
    end);
end);

function tester(input, expected)
  local err_msg = ("Failed for input: {\n  \"%s\"\n}\n"):format(table.concat(input, "\",\n  \""));
  local actual = list_animals(input);
  assert.are.same(expected, actual, err_msg);
end