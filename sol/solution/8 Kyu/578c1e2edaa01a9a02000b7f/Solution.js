/**
 * Solution
 */
function aliasGen(first, last){
  const f = first[0].toUpperCase();
  const l = last[0].toUpperCase();
  if(!/^[A-Z]$/.test(f) || !/^[A-Z]$/.test(l)){
    return "Your name must start with a letter from A - Z.";
  }
  return `${firstName[f]} ${surname[l]}`;
}





/**
 * Sample Tests
 */
const { assert } = require('chai');

describe("Tests", () => {
  it("test", () => {
    assert.strictEqual(aliasGen("Mike", "Millington"), "Malware Mike");
    assert.strictEqual(aliasGen("Fahima", "Tash"), "Function T-Rex");
    assert.strictEqual(aliasGen("Daisy", "Petrovic"), "Data Payload");
    assert.strictEqual(aliasGen("7393424", "Anumbha"), "Your name must start with a letter from A - Z.");
    assert.strictEqual(aliasGen("Anuddanumbha", "23200"), "Your name must start with a letter from A - Z.");
  });
});
