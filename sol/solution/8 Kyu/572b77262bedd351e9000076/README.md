# [**pick a set of first elements**](https://www.codewars.com/kata/572b77262bedd351e9000076)

## **Description:**
Write a function to get the first element(s) of a sequence. Passing a parameter `n` (default=`1`) will return the first `n` element(s) of the sequence.

If `n` == `0` return an empty sequence `[]`

### **Examples**
```md
var arr = ['a', 'b', 'c', 'd', 'e'];
first(arr) //=> ['a'];
first(arr, 2) //=> ['a', 'b']
first(arr, 3) //=> ['a', 'b', 'c'];
first(arr, 0) //=> [];
```

## **Solutions:**

#### **C#**
```cs
using System;
using System.Linq;
public class Kata
{
  public static object[] TakeFirstElements(object[] array, int n = 1)
  {
    if (n == 0) return new object[] {};
    return array.Take(n).ToArray();
  }
}
```

#### **JavaScript**
```js
function first(arr, n = 1) {
  if (n === 0) return [];
  return arr.slice(0, n);
}
```

#### **Python**
```py
def first(seq, n=1):
    if n == 0:
        return []
    return seq[:n]
```