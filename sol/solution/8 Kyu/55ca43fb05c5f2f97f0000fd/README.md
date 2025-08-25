# [**Fix the loop!**](https://www.codewars.com/kata/55ca43fb05c5f2f97f0000fd)

Your collegue wrote an simple loop to list his favourite animals. But there seems to be a minor mistake in the grammar, which prevents the program to work. Fix it! :)

If you pass the list of your favourite animals to the function, you should get the list of the animals with orderings and newlines added.

For example, passing in:

```md
[ "dog", "cat", "elephant" ]
```

will result in:

```md
"1. dog\n2. cat\n3. elephant\n"
```

## **Solutions:**

#### **Lua**
```lua
function list_animals(animals)
    local lst = ''
    for i = 1, #animals do
        lst = lst .. i .. '. ' .. animals[i] .. '\n'
    end
    return lst
end
return list_animals
```

#### **Python**
```py
def list_animals(animals):
    lst = ''
    for i in range(len(animals)):
        lst += str(i + 1) + '. ' + animals[i] + '\n'
    return lst
```