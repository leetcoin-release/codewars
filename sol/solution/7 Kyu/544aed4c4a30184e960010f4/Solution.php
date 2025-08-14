<?php
/*
Solution
*/
function divisors($integer) {
    $result = [];
    for ($i = 2; $i < $integer; $i++) {
        if ($integer % $i === 0) {
            $result[] = $i;
        }
    }
    return empty($result) ? "$integer is prime" : $result;
}





/*
Sample Tests
*/
class DivisorsTest extends TestCase {
  public function testExamples() {
    $this->assertSame([3, 5], divisors(15), '$integer = 15');
    $this->assertSame([2, 3, 4, 6], divisors(12), '$integer = 12');
    $this->assertSame('13 is prime', divisors(13), '$integer = 13');
  }
}
?>