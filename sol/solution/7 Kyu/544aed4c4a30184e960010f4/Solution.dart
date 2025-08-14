/*
* Solution
*/
Object divisors(int number) {
  List<int> result = [];
  for (int i = 2; i <= number ~/ 2; i++) {
    if (number % i == 0) {
      result.add(i);
    }
  }
  if (result.isEmpty) {
    return "$number is prime";
  }
  return result;
}





/*
* Sample Tests
*/
// See https://pub.dartlang.org/packages/test
import "package:test/test.dart";
import "package:solution/solution.dart";

void main() {
  void doTest(int n, Object expected) {
    test('divisors($n)', () {
      expect(divisors(n), equals(expected));
    });
  }
  
  group("Sample Tests", () {
    doTest(15, [3, 5]);
    doTest(12, [2, 3, 4, 6]);
    doTest(13, '13 is prime');
  });
}