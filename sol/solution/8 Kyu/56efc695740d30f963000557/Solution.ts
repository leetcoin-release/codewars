/*
Solution
*/
export function toAlternatingCase(s: string): string {
  return s
    .split("")
    .map(ch => ch === ch.toLowerCase() ? ch.toUpperCase() : ch.toLowerCase())
    .join("");
}





/*
Sample Tests
*/
import solution = require('./solution');
// import the type of assertion library you wish to use (Chai recommended)
import {assert} from "chai";

describe("Sample Test Cases", function(){
  it("Should return a revesed case value", function() {
    assert.equal(solution.toAlternatingCase("hello world"), "HELLO WORLD");
    assert.equal(solution.toAlternatingCase("HeLLo WoRLD"), "hEllO wOrld");
    assert.equal(solution.toAlternatingCase("1a2b3c4d5e"), "1A2B3C4D5E");
  });
});