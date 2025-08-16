# [**Crash Override**](https://www.codewars.com/kata/578c1e2edaa01a9a02000b7f)

<img src="https://media.giphy.com/media/13AN8X7jBIm15m/giphy.gif" style="width: 100%; height: 400;"/>

Every budding hacker needs an alias! `The Phantom Phreak`, `Acid Burn`, `Zero Cool` and `Crash Override` are some notable examples from the film `Hackers`.

Your task is to create a function that, given a proper first and last name, will return the correct alias.

**Notes:**
- Two objects that return a one word name in response to the first letter of the first name and one for the first letter of the surname are already given. See the examples below for further details.
- If the first character of either of the names given to the function is not a letter from `A - Z`, you should return `"Your name must start with a letter from A - Z."`
- Sometimes people might forget to capitalize the first letter of their name so your function should accommodate for these grammatical errors.

## **Examples:**
```md
# These two hashes are preloaded, you need to use them in your code
FIRST_NAME = {'A': 'Alpha', 'B': 'Beta', 'C': 'Cache', ...}
SURNAME = {'A': 'Analogue', 'B': 'Bomb', 'C': 'Catalyst' ...}

alias_gen('Larry', 'Brentwood') == 'Logic Bomb'
alias_gen('123abc', 'Petrovic') == 'Your name must start with a letter from A - Z.'
```

Happy hacking!

## **Solutions:**

#### **C#**
```cs
public partial class Kata
{
    public static string AliasGen(string fName, string lName)
    {
        if (string.IsNullOrEmpty(fName) || string.IsNullOrEmpty(lName))
            return "Your name must start with a letter from A - Z.";
        char f = char.ToUpper(fName[0]);
        char l = char.ToUpper(lName[0]);
        if (!char.IsLetter(f) || !char.IsLetter(l))
            return "Your name must start with a letter from A - Z.";
        return $"{FirstName[f.ToString()]} {Surname[l.ToString()]}";
    }
}
```

#### **JavaScript**
```js
function aliasGen(first, last){
  const f = first[0].toUpperCase();
  const l = last[0].toUpperCase();
  if(!/^[A-Z]$/.test(f) || !/^[A-Z]$/.test(l)){
    return "Your name must start with a letter from A - Z.";
  }
  return `${firstName[f]} ${surname[l]}`;
}
```

#### **Python**
```py
from preloaded import FIRST_NAME, SURNAME
def alias_gen(f_name: str, l_name: str) -> str:
    first_initial = f_name[0].upper()
    last_initial = l_name[0].upper()
    if not first_initial.isalpha() or not last_initial.isalpha():
        return "Your name must start with a letter from A - Z."
    return f"{FIRST_NAME[first_initial]} {SURNAME[last_initial]}"
```

#### **Ruby**
```rb
def alias_gen(first_name, surname)
  f = first_name[0].upcase
  s = surname[0].upcase
  unless f =~ /[A-Z]/ && s =~ /[A-Z]/
    return "Your name must start with a letter from A - Z."
  end
  "#{FIRST_NAME[f]} #{SURNAME[s]}"
end
```

#### **Scala**
```scala
import Preloaded.{forenames, surnames}
def aliasGen(fname: String, sname: String): String = {
  val firstInitial = fname.head.toUpper
  val lastInitial  = sname.head.toUpper

  if (!firstInitial.isLetter || !lastInitial.isLetter)
    "Your name must start with a letter from A - Z."
  else
    s"${forenames(firstInitial)} ${surnames(lastInitial)}"
}