/*
Solution
*/
export function divisors(integer: number): number[] | string {
  const result: number[] = [];
  for (let i = 2; i < integer; i++) {
    if (integer % i === 0) {
      result.push(i);
    }
  }
  return result.length > 0 ? result : `${integer} is prime`;
}





/*
Sample Tests
*/
import { assert } from 'chai';
import { divisors } from './solution';

describe('Sample tests', () => {
  it('integer = 15', () => assert.deepEqual(divisors(15), [3, 5]));
  it('integer = 12', () => assert.deepEqual(divisors(12), [2, 3, 4, 6]));
  it('integer = 13', () => assert.deepEqual(divisors(13), '13 is prime'));
});
