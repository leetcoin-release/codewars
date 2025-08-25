/*
Solution
*/
function first(arr, n = 1) {
  if (n === 0) return [];
  return arr.slice(0, n);
}





/*
Sample Tests
*/
const { assert } = require('chai');

describe("Tests", () => {
  it("test", () => {
    const arr = ['a', 'b', 'c', 'd', 'e'];
    assert.sameOrderedMembers(first([...arr]   ),      ['a']);
    assert.sameOrderedMembers(first([...arr], 2), ['a', 'b']);
  });
});
