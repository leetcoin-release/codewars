# [**Counting Characters**](https://www.codewars.com/kata/55f1b763dd670651620000ce)

Define a method named `countCharOccurrences` or `count_char_occurrences` that accepts a string and a char as inputs and returns the number of times the char occurs in the string as an int.

## **Solutions:**

#### **Java**
```java
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
```

#### **Python**
```py
def count_char_occurrences(strng, char):
    return strng.count(char)
```