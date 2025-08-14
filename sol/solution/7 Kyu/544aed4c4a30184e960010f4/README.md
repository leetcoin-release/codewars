# [**Find the divisors!**](https://www.codewars.com/kata/544aed4c4a30184e960010f4)

## **Description:**

Create a function named `divisors`/`Divisors` that takes an integer `n > 1` and returns an array with all of the integer's divisors(except for 1 and the number itself), from smallest to largest. If the number is prime return the string '(integer) is prime' (`null` in C#, empty table in COBOL) (use `Either String a` in Haskell and `Result<Vec<u32>, String>` in Rust).

## **Examples:**

```md
divisors(12) --> [2, 3, 4, 6]
divisors(25) --> [5]
divisors(13) --> "13 is prime"
```

## **Solutions:**

#### **C**
```c
#include <stddef.h>
void divisors(unsigned n, size_t *length, unsigned array[]) {
    *length = 0; 
    for (unsigned i = 2; i <= n / 2; i++) {
        if (n % i == 0) {        
            array[*length] = i;  
            (*length)++;           
        }
    }
}
```

#### **COBOL**
```cbl
       identification division.
       program-id. Divisors.
       data division.
       working-storage section.
       01  i           pic 9(6).
       linkage section.
       01  num         pic 9(6).
       01  result.
           03  resLen  pic 9(3) value 0.
           03  res     pic 9(6) occurs 0 to 200 times
                                depending on resLen.
       procedure division using num result.
           initialize result
           move 0 to resLen
           perform varying i from 2 by 1 until i > (num / 2)
               if function mod(num, i) = 0
                   add 1 to resLen
                   move i to res(resLen)
               end-if
           end-perform

           goback.
       end program Divisors.
```

#### **CoffeeScript**
```coffee
divisors = (integer) ->
  result = []
  for i in [2...integer]
    if integer % i is 0
      result.push i
  if result.length is 0
    return "#{integer} is prime"
  result
```

#### **C#**
```cs
public class Kata
{
    public static int[] Divisors(int n)
    {
        var divisorsList = new System.Collections.Generic.List<int>();
        for (int i = 2; i <= n / 2; i++)
        {
            if (n % i == 0)
            {
                divisorsList.Add(i);
            }
        }
        if (divisorsList.Count == 0)
        {
            return null; 
        }
        return divisorsList.ToArray();
    }
}
```

##### **Dart**
```dart
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
```

#### **Elixir**
```ex
defmodule FindTheDivisors do
  def divisors(integer) when integer <= 2 do
    "#{integer} is prime"
  end
  def divisors(integer) do
    divs = for x <- 2..(integer - 1), rem(integer, x) == 0, do: x
    if divs == [] do
      "#{integer} is prime"
    else
      divs
    end
  end
end
```

#### **Haskell**
```hs
module Divisors where
divisors :: (Show a, Integral a) => a -> Either String [a]
divisors n =
  let ds = [x | x <- [2 .. n - 1], n `mod` x == 0]
  in if null ds
     then Left (show n ++ " is prime")
     else Right ds
```

#### **JavaScript**
```js
function divisors(integer) {
  let result = [];
  for (let i = 2; i < integer; i++) {
    if (integer % i === 0) {
      result.push(i);
    }
  }
  return result.length ? result : `${integer} is prime`;
}
```

#### **Lua**
```lua
local function divisors(integer)
  local result = {}
  for i = 2, integer - 1 do
    if integer % i == 0 then
      table.insert(result, i)
    end
  end
  if #result == 0 then
    return integer .. " is prime"
  else
    return result
  end
end
return divisors
```

#### **Php**
```php
<?php
function divisors($integer) {
    $result = [];
    for ($i = 2; $i < $integer; $i++) {
        if ($integer % $i === 0) {
            $result[] = $i;
        }
    }
    return empty($result) ? "$integer is prime" : $result;
}
?>
```

#### **Python**
```py
def divisors(integer):
    result = [i for i in range(2, integer) if integer % i == 0]
    return result if result else f"{integer} is prime"
```

#### **Ruby**
```rb
def divisors(n)
  result = (2...n).select { |i| n % i == 0 }
  result.empty? ? "#{n} is prime" : result
end
```

#### **Rust**
```rs
fn divisors(integer: u32) -> Result<Vec<u32>, String> {
    let mut result = Vec::new();
    for i in 2..integer {
        if integer % i == 0 {
            result.push(i);
        }
    }
    if result.is_empty() {
        Err(format!("{} is prime", integer))
    } else {
        Ok(result)
    }
}
```

#### **TypeScript**
```ts
export function divisors(integer: number): number[] | string {
  const result: number[] = [];
  for (let i = 2; i < integer; i++) {
    if (integer % i === 0) {
      result.push(i);
    }
  }
  return result.length > 0 ? result : `${integer} is prime`;
}
```