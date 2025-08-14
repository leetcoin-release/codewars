/*
* Solution
*/
String toAlternatingCase(final String str) {
  final buffer = StringBuffer();
  for (var codeUnit in str.codeUnits) {
    var c = String.fromCharCode(codeUnit);
    if (c.toUpperCase() != c && c.toLowerCase() == c) {
      buffer.write(c.toUpperCase());
    } else if (c.toLowerCase() != c && c.toUpperCase() == c) {
      buffer.write(c.toLowerCase());
    } else {
      buffer.write(c);
    }
  }
  return buffer.toString();
}





/*
* Sample Tests
*/
// See https://pub.dartlang.org/packages/test
import "package:test/test.dart";
import "package:solution/solution.dart";

void main() {
  group("Sample Test Cases", () {
    test("values: 'hello world'; expected result: 'HELLO WORLD'", () => expect(toAlternatingCase("hello world"), equals("HELLO WORLD")));
    test("values: 'HeLLo WoRLD'; expected result: 'hEllO wOrld'", () => expect(toAlternatingCase("HeLLo WoRLD"), equals("hEllO wOrld")));
    test("values: '1a2b3c4d5e'; expected result: '1A2B3C4D5E'", () => expect(toAlternatingCase("1a2b3c4d5e"), equals("1A2B3C4D5E")));
    test("values: '12345'; expected result: '12345'", () => expect(toAlternatingCase("12345"), equals("12345")));
    test("values: 'String.prototype.toAlternatingCase'; expected result: 'sTRING.PROTOTYPE.TOaLTERNATINGcASE'", () => expect(toAlternatingCase("String.prototype.toAlternatingCase"), equals("sTRING.PROTOTYPE.TOaLTERNATINGcASE")));
  });
}
