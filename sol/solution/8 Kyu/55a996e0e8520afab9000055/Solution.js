/*
Solution
*/
function cookie(x) {
  let name;
  if (typeof x === "string") {
    name = "Zach";
  } else if (typeof x === "number") {
    name = "Monica";
  } else {
    name = "the dog";
  }
  return `Who ate the last cookie? It was ${name}!`;
}





/*
Sample Tests
*/
const { assert } = require('chai');

describe('Example tests', () => {
  it('should return correct messages for given inputs', () => {
    assert.strictEqual(cookie("Ryan"), "Who ate the last cookie? It was Zach!");
    assert.strictEqual(cookie(26), "Who ate the last cookie? It was Monica!");
    assert.strictEqual(cookie(2.3), "Who ate the last cookie? It was Monica!");
    assert.strictEqual(cookie(true), "Who ate the last cookie? It was the dog!");
  });
});
