# [**altERnaTing cAsE <=> ALTerNAtiNG CaSe**](https://www.codewars.com/kata/56efc695740d30f963000557)

## **Description:**

### **altERnaTIng cAsE <=> ALTerNAtiNG CaSe**

Define `String.prototype.toAlternatingCase` (or a similar function/method such as` to_alternating_case`/`toAlternatingCase`/`ToAlternatingCase` in your selected language; **see the initial solution for details**) such that each lowercase letter becomes uppercase and each uppercase letter becomes lowercase. For example:

```md
"hello world".toAlternatingCase() === "HELLO WORLD"
"HELLO WORLD".toAlternatingCase() === "hello world"
"hello WORLD".toAlternatingCase() === "HELLO world"
"HeLLo WoRLD".toAlternatingCase() === "hEllO wOrld"
"12345".toAlternatingCase()       === "12345"                   // Non-alphabetical characters are unaffected
"1a2b3c4d5e".toAlternatingCase()  === "1A2B3C4D5E"
"String.prototype.toAlternatingCase".toAlternatingCase() === "sTRING.PROTOTYPE.TOaLTERNATINGcASE"
```

As usual, your function/method should be pure, i.e. it should not mutate the original string.

## **Solutions:**

#### **NASM**
```asm
; to_alternating_case.asm
; Linux x86-64 NASM syntax
; Compile: nasm -f elf64 to_alternating_case.asm && gcc -no-pie -o test test.c to_alternating_case.o

extern malloc
section .text
global to_alternating_case

to_alternating_case:
    ; RDI = const char *input

    push rdi                   ; save pointer for later
    xor rcx, rcx               ; length counter

.len_loop:
    cmp byte [rdi + rcx], 0
    je .len_done
    inc rcx
    jmp .len_loop

.len_done:
    inc rcx                    ; include null terminator
    mov rdi, rcx               ; malloc argument = length
    call malloc
    mov rsi, rax               ; rsi = dest
    pop rdi                    ; rdi = src

    xor rdx, rdx               ; index = 0

.copy_loop:
    mov al, [rdi + rdx]        ; load char
    cmp al, 0
    je .done_copy

    cmp al, 'a'
    jb .check_upper            ; if < 'a', maybe uppercase
    cmp al, 'z'
    jg .check_upper            ; if > 'z', maybe uppercase
    sub al, 32                 ; lowercase → uppercase
    jmp .store_char

.check_upper:
    cmp al, 'A'
    jb .store_char
    cmp al, 'Z'
    jg .store_char
    add al, 32                 ; uppercase → lowercase

.store_char:
    mov [rsi + rdx], al
    inc rdx
    jmp .copy_loop

.done_copy:
    mov byte [rsi + rdx], 0    ; null terminate
    mov rax, rsi               ; return pointer
    ret
```

#### **C**
```c
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
char *to_alternating_case(const char *s) {
    size_t len = strlen(s);
    char *result = (char *)calloc(len + 1, sizeof(char));
    if (!result) {
        return NULL;
    }
    for (size_t i = 0; i < len; i++) {
        if (islower(s[i])) {
            result[i] = toupper(s[i]);
        } else if (isupper(s[i])) {
            result[i] = tolower(s[i]);
        } else {
            result[i] = s[i];
        }
    }
    result[len] = '\0';
    return result;
}
```

#### **COBOL**
```cbl
        IDENTIFICATION DIVISION.
        PROGRAM-ID. ALTERNATING-CASE.
        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01  I                PIC 9(3).
        LINKAGE SECTION.
        01  S.
            03 S-LENGTH      PIC 9(3).
            03 S-CHARS.
                05 S-CHAR    PIC A OCCURS 1 TO 200 TIMES 
                                DEPENDING ON S-LENGTH.
        01  RESULT.
            03 RES-LENGTH    PIC 9(3).
            03 RES-CHARS.
                05 RES-CHAR  PIC A OCCURS 1 TO 200 TIMES 
                                DEPENDING ON RES-LENGTH.
        PROCEDURE DIVISION USING S RESULT.
            MOVE S-LENGTH TO RES-LENGTH
            PERFORM VARYING I FROM 1 BY 1 UNTIL I > S-LENGTH
                EVALUATE TRUE
                    WHEN S-CHAR(I) >= 'a' AND S-CHAR(I) <= 'z'
                        MOVE FUNCTION UPPER-CASE(S-CHAR(I)) 
                            TO RES-CHAR(I)
                    WHEN S-CHAR(I) >= 'A' AND S-CHAR(I) <= 'Z'
                        MOVE FUNCTION LOWER-CASE(S-CHAR(I)) 
                            TO RES-CHAR(I)
                    WHEN OTHER
                        MOVE S-CHAR(I) TO RES-CHAR(I)
                END-EVALUATE
            END-PERFORM
            GOBACK.
        END PROGRAM ALTERNATING-CASE.
```

#### **CoffeeScript**
```coffee
String::toAlternatingCase = ->
  @split('')            
   .map((c) ->
     if c >= 'a' and c <= 'z'         
       c.toUpperCase()
     else if c >= 'A' and c <= 'Z'     
       c.toLowerCase()
     else                               
       c
   )
   .join('')
```

#### **C++**
```cpp
#include <string>
#include <cctype>
using namespace std;
string to_alternating_case(const string& str)
{
    string result;
    result.reserve(str.size()); 
    for (char c : str) {
        if (isupper(static_cast<unsigned char>(c)))
            result += static_cast<char>(tolower(static_cast<unsigned char>(c)));
        else if (islower(static_cast<unsigned char>(c)))
            result += static_cast<char>(toupper(static_cast<unsigned char>(c)));
        else
            result += c; 
    }
    return result;
}
```

#### **Crystal**
```cr
class String
  def to_alternating_case
    self.chars.map do |c|
      if c.ascii_lowercase?
        c.upcase
      elsif c.ascii_uppercase?
        c.downcase
      else
        c
      end
    end.join
  end
end
```

#### **C#**
```cs
using System;
using System.Text;
namespace Extensions
{
    public static class StringExt
    {
        public static string ToAlternatingCase(this string s)
        {
            if (s == null) return null;
            var result = new StringBuilder(s.Length);
            foreach (char c in s)
            {
                if (char.IsLower(c))
                    result.Append(char.ToUpper(c));
                else if (char.IsUpper(c))
                    result.Append(char.ToLower(c));
                else
                    result.Append(c);
            }
            return result.ToString();
        }
    }
}
```

#### **Dart**
```dart
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
```

#### **Elixir**
```ex
defmodule Codewars.StringUtils do
  def alter_case(str) do
    str
    |> String.graphemes()
    |> Enum.map(fn c ->
      cond do
        c =~ ~r/^[a-z]$/ -> String.upcase(c)
        c =~ ~r/^[A-Z]$/ -> String.downcase(c)
        true -> c
      end
    end)
    |> Enum.join()
  end
end
```

#### **Factor**
```factor
USING: kernel sequences math math.order ascii ;
IN: kata
: swap-case ( ch -- ch' )
    dup CHAR: a CHAR: z between?
    [ 32 - ]                           ! lowercase -> uppercase
    [ dup CHAR: A CHAR: Z between?
        [ 32 + ]                       ! uppercase -> lowercase
        [ ]                            ! non-alpha unchanged
      if
    ] if ;
: >alternating ( str -- new-str )
    [ swap-case ] map ;
```

#### **Go**
```go
package kata
import "unicode"
func ToAlternatingCase(str string) string {
	runes := []rune(str)
	for i, r := range runes {
		if unicode.IsLower(r) {
			runes[i] = unicode.ToUpper(r)
		} else if unicode.IsUpper(r) {
			runes[i] = unicode.ToLower(r)
		}
	}
	return string(runes)
}
```

#### **Haskell**
```haskell
module Codewars.Kata.AlternatingCase where
import Data.Char (isLower, isUpper, toLower, toUpper)
toAlternatingCase :: String -> String
toAlternatingCase = map swapCase
  where
    swapCase c
      | isLower c = toUpper c
      | isUpper c = toLower c
      | otherwise = c
```

#### **Java**
```java
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
```

#### **Julia**
```julia
function to_alternating_case(string)
    join([isuppercase(c) ? lowercase(c) : islowercase(c) ? uppercase(c) : c for c in string])
end
```

#### **Javascript**
```javascript
String.prototype.toAlternatingCase = function () {
  return this.split('')
    .map(c => {
      if (c >= 'a' && c <= 'z') return c.toUpperCase();
      if (c >= 'A' && c <= 'Z') return c.toLowerCase();
      return c;
    })
    .join('');
};
```

#### **Lua**
```lua
local function to_alternating_case(s)
  local result = {}
  for i = 1, #s do
    local c = s:sub(i, i)
    if c:match("%l") then
      table.insert(result, c:upper())
    elseif c:match("%u") then
      table.insert(result, c:lower())
    else
      table.insert(result, c)
    end
  end
  return table.concat(result)
end
return to_alternating_case
```

#### **Python**
```py
def to_alternating_case(string):
    return ''.join(
        ch.lower() if ch.isupper() else
        ch.upper() if ch.islower() else
        ch
        for ch in string
    )
```

#### **Ruby**
```ruby
class String
  def to_alternating_case
    self.chars.map do |ch|
      if ch =~ /[A-Z]/
        ch.downcase
      elsif ch =~ /[a-z]/
        ch.upcase
      else
        ch
      end
    end.join
  end
end
```

#### **Rust**
```rust
fn to_alternating_case(s: &str) -> String {
    s.chars()
        .map(|c| {
            if c.is_ascii_lowercase() {
                c.to_ascii_uppercase()
            } else if c.is_ascii_uppercase() {
                c.to_ascii_lowercase()
            } else {
                c
            }
        })
        .collect()
}
```

#### **Scala**
```scala
implicit class StringExtensions(s: String) {
  def toAlternatingCase: String = {
    s.map {
      case c if c.isLower => c.toUpper
      case c if c.isUpper => c.toLower
      case c => c
    }
  }
}
```

#### **Typescript**
```ts
export function toAlternatingCase(s: string): string {
  return s
    .split("")
    .map(ch => ch === ch.toLowerCase() ? ch.toUpperCase() : ch.toLowerCase())
    .join("");
}
```