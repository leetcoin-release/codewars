/*
Solution
*/
const arrowFunc = (arr) => arr.map(num => String.fromCharCode(num)).join('');





/*
Sample Tests
*/
const { assert } = require('chai');

describe('Example tests', () => {
  it('should convert numbers to letters', () => {
    tester([84,101,115,116], 'Test');
    tester([70,85,83,32,82,79,72,32,68,65,72], 'FUS ROH DAH');
  });
});

function tester(arr, expected) {
  const actual = arrowFunc(arr);
  assert.strictEqual(actual, expected, `Testing for arr = ${JSON.stringify(arr)}\n\n`);
}