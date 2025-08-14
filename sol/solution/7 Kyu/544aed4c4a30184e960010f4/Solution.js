/**
 * Solution
 */
function divisors(integer) {
  let result = [];
  for (let i = 2; i < integer; i++) {
    if (integer % i === 0) {
      result.push(i);
    }
  }
  return result.length ? result : `${integer} is prime`;
}





/*
 * Sample Tests
 */
const { assert } = require('chai');

describe("Sample tests", () => {
  it("integer = 15", () => assert.deepEqual(divisors(15), [3, 5]));
  it("integer = 12", () => assert.deepEqual(divisors(12), [2, 3, 4, 6]));
  it("integer = 13", () => assert.deepEqual(divisors(13), "13 is prime"));
});
