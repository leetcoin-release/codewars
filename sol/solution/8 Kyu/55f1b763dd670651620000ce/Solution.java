/*
Solution
*/
interface Count {
    static int countCharOccurrences(String s, char c) {
        int count = 0;
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) == c) {
                count++;
            }
        }
        return count;
    }
}





/*
Sample Tests
*/
import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

class CountTest {
  @Test
  void test_some_characters() {
    assertEquals(3, Count.countCharOccurrences("missippi", 'i'));
    assertEquals(2, Count.countCharOccurrences("feed", 'e'));
  }

  @Test
  void test_all_characters() {
    assertEquals(8, Count.countCharOccurrences("aaaaaaaa", 'a'));
  }

  @Test
  void test_no_characters() {
    assertEquals(0, Count.countCharOccurrences("quicksilver", 'z'));
  }
}