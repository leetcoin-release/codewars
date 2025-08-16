/*
Solution
*/
import Preloaded.{forenames, surnames}
def aliasGen(fname: String, sname: String): String = {
  val firstInitial = fname.head.toUpper
  val lastInitial  = sname.head.toUpper

  if (!firstInitial.isLetter || !lastInitial.isLetter)
    "Your name must start with a letter from A - Z."
  else
    s"${forenames(firstInitial)} ${surnames(lastInitial)}"
}





/*
Sample Tests
*/
class AliasGenSpec extends org.scalatest.flatspec.AnyFlatSpec {
  "aliasGen" should "handle properly capitalized names" in {
    val testCases = Seq(
        ("Mike", "Millington", "Malware Mike"),
        ("Fahima", "Tash", "Function T-Rex"),
        ("Daisy", "Petrovic", "Data Payload"),
        ("Barny", "White", "Beta Worm"),
        ("Hank", "Kutz", "Half-life Killer")
    )
    
    testCases foreach {
      (fname, sname, expected) =>
        assertResult(expected, s"for aliasGen(\"$fname\", \"$sname\")") {
          aliasGen(fname, sname)
        }
    }
  }

  it should "handle lowercased names" in {
    assertResult("WiFi Worm", s"for aliasGen(\"walter\", \"white\")") {
      aliasGen("walter", "white")
    }
  }
    
  it should "handle invalid names" in {
    assertResult("Your name must start with a letter from A - Z.", s"for aliasGen(\"123abc\", \"Pinkman\")") {
      aliasGen("123abc", "Pinkman")
    }
  }
}