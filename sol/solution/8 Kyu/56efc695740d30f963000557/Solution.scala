/*
Solution
*/
implicit class StringExtensions(s: String) {
  def toAlternatingCase: String = {
    s.map {
      case c if c.isLower => c.toUpper
      case c if c.isUpper => c.toLower
      case c => c
    }
  }
}





/*
Sample Tests
*/
class AlternatingCaseSpec extends org.scalatest.flatspec.AnyFlatSpec {
  "toAlternatingCase" should "pass basic tests" in {
    val testCases = List(
      ("hello world", "HELLO WORLD"),
      ("HELLO WORLD", "hello world"),
      ("hello WORLD", "HELLO world"),
      ("HeLLo WoRLD", "hEllO wOrld"),
      ("12345", "12345"),
      ("1a2b3c4d5e", "1A2B3C4D5E"),
      ("Hello World".toAlternatingCase, "Hello World")
    )
    
    testCases.foreach {
      case (s, expected) => assertResult(expected, s"\nInput:\n  \"$s\"") (s.toAlternatingCase)
    }
  }
}
