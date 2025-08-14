/**
 * Solution
**/
public class StringUtils {
  public static String toAlternativeString(String str) {
    StringBuilder result = new StringBuilder();
    for (char c : str.toCharArray()) {
      if (Character.isLowerCase(c)) {
        result.append(Character.toUpperCase(c));
      } else if (Character.isUpperCase(c)) {
        result.append(Character.toLowerCase(c));
      } else {
        result.append(c);
      }
    }
    return result.toString();
  }
}





/**
* Sample Tests
**/
import org.junit.Test;

import static org.junit.Assert.*;

public class StringUtilsTest {

  @Test
  public void fixedTests() {
    assertEquals("HELLO WORLD", StringUtils.toAlternativeString("hello world"));
    assertEquals("hello world", StringUtils.toAlternativeString("HELLO WORLD"));
    assertEquals("HELLO world", StringUtils.toAlternativeString("hello WORLD"));
    assertEquals("hEllO wOrld", StringUtils.toAlternativeString("HeLLo WoRLD"));
    assertEquals("Hello World", StringUtils.toAlternativeString(StringUtils.toAlternativeString("Hello World")));
    assertEquals("12345", StringUtils.toAlternativeString("12345"));
    assertEquals("1A2B3C4D5E", StringUtils.toAlternativeString("1a2b3c4d5e"));
    assertEquals("sTRINGuTILS.TOaLTERNATINGcASE", StringUtils.toAlternativeString("StringUtils.toAlternatingCase"));
  }
  
  @Test
  public void kataTitleTests() {
    assertEquals("ALTerNAtiNG CaSe", StringUtils.toAlternativeString("altERnaTIng cAsE"));
    assertEquals("altERnaTIng cAsE", StringUtils.toAlternativeString("ALTerNAtiNG CaSe"));
    assertEquals("ALTerNAtiNG CaSe <=> altERnaTIng cAsE", StringUtils.toAlternativeString("altERnaTIng cAsE <=> ALTerNAtiNG CaSe"));
    assertEquals("altERnaTIng cAsE <=> ALTerNAtiNG CaSe", StringUtils.toAlternativeString("ALTerNAtiNG CaSe <=> altERnaTIng cAsE"));
  }
}