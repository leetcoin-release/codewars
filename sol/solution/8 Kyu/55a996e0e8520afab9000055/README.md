# [**Who ate the cookie?**](https://www.codewars.com/kata/55a996e0e8520afab9000055)

## **Description:**

For this problem you must create a program that says who ate the last cookie. If the input is a string then "Zach" ate the cookie. If the input is a float or an int then "Monica" ate the cookie. If the input is anything else "the dog" ate the cookie. The way to return the statement is: "Who ate the last cookie? It was (name)!"

Ex: Input = "hi" --> Output = "Who ate the last cookie? It was Zach! (The reason you return Zach is because the input is a string)

Note: Make sure you return the correct message with correct spaces and punctuation.

Please leave feedback for this kata. Cheers!

## **Solutions:**

#### **JavaScript**
```js
function cookie(x) {
  let name;
  if (typeof x === "string") {
    name = "Zach";
  } else if (typeof x === "number") {
    name = "Monica";
  } else {
    name = "the dog";
  }
  return `Who ate the last cookie? It was ${name}!`;
}
```

#### **Python**
```py
def cookie(x):
    if isinstance(x, str):
        name = "Zach"
    elif isinstance(x, bool):  
        name = "the dog"
    elif isinstance(x, (int, float)):
        name = "Monica"
    else:
        name = "the dog"
    return f"Who ate the last cookie? It was {name}!"
```

#### **Ruby**
```rb
def cookie(x)
  if x.is_a?(String)
    name = "Zach"
  elsif x.is_a?(Integer) || x.is_a?(Float)
    name = "Monica"
  else
    name = "the dog"
  end
  "Who ate the last cookie? It was #{name}!"
end
```