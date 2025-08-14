###
solution
###
divisors = (integer) ->
  result = []
  for i in [2...integer]  # 2 to integer-1
    if integer % i is 0
      result.push i
  if result.length is 0
    return "#{integer} is prime"
  result





###
Sample Tests
###
describe "Find the divisors!", ->

  chai = require 'chai'
  assert = chai.assert
  chai.config.truncateThreshold = 0
  
  doTest = (num, expected) ->
    actual = divisors num
    assert.deepEqual actual, expected, "divisors(#{num})"
    
  it 'Sample Tests', ->
    doTest(15, [3,5])
    doTest(12, [2,3,4,6])
    doTest(13, "13 is prime")
