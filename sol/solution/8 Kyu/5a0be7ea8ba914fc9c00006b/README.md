# [**The falling speed of petals**](https://www.codewars.com/kata/5a0be7ea8ba914fc9c00006b)

## **Description:**

When it's spring Japanese cherries blossom, it's called "sakura" and it's admired a lot. The petals start to fall in late April.

Suppose that the falling speed of a petal is 5 centimeters per second (5 cm/s), and it takes 80 seconds for the petal to reach the ground from a certain branch.

Write a function that receives the speed (in cm/s) of a petal as input, and returns the time it takes for that petal to reach the ground `from the same branch`.

**Notes:**
- The movement of the petal is quite complicated, so in this case we can see the velocity as a constant during its falling.
- Pay attention to the data types.
- If the initial velocity is non-positive, the return value should be `0`

## **Solutions:**

#### **C++**
```cpp
double SakuraFall(double v) {
    if (v <= 0) return 0.0;
    return 400.0 / v;
}
```

#### **C#**
```cs
public static class Kata
{
    public static double SakuraFall(double v)
    {
        if (v <= 0) return 0.0;
        return 400.0 / v;
    }
}
```

#### **Julia**
```jl
function sakura_fall(v)
    if v <= 0
        return 0.0
    else
        return 400.0 / v
    end
end
```

#### **JavaScript**
```js
function sakuraFall(v) {
  if (v <= 0) return 0;
  return 400 / v;
}
```

#### **Python**
```py
def sakura_fall(v):
    if v <= 0:
        return 0.0
    return 400.0 / v
```

#### **Ruby**
```rb
def sakura_fall(v)
  return 0.0 if v <= 0
  400.0 / v
end
```

#### **TypeScript**
```ts
export function sakuraFall(v: number): number {
  if (v <= 0) return 0;
  return 400 / v;
}
```