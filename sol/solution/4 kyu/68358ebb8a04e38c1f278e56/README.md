# [**Mouse Over (x,y) (Performance Version)**](https://www.codewars.com/kata/68358ebb8a04e38c1f278e56)

## **Description:**

You are tasked with implementing a `MouseOver(x, y)` functionality.

**This is a performance version of** [this kata](https://www.codewars.com/kata/68356baf60410813d358bb2c).

Given a list of rectangles displayed on a screen, your program must process a series of queries to determine which rectangle, if any, contains a given point.

In the graphic below, you can see examples of a point inside a rectangle, one on the border, one inside two overlapping rectangles, and one outside any rectangle.

<img src="https://raw.githubusercontent.com/leetcoin-releases/codewars/refs/heads/main/res/ino/481090912.jpg" style="width: 100%; height: 600;"/>

Implement a class that takes a list of rectangles during initialization and provides a method to process query points `(x, y)`. Each query should be processed independently, and there may be many such queries.

### **Input**

#### **Constructor input:**
- A list of rectangles, where each is defined by `(x, y, width, height)`. This represents a rectangle that extends from `x` to `x + width` along the x-axis and from `y` to `y + height` along the y-axis.

#### **Query input:**
- A single point represented as a tuple `(x, y)`.

### **Output:**
For each query point, return the rectangle that contains it, or indicate that no such rectangle exists.

### **Rules:**
- All coordinates and dimensions are integers.
- Rectangles may overlap
- A point that lies on the border of a rectangle is considered to be inside the rectangle
- If a point is contained in multiple rectangles, return the first rectangle from the input list that contains it.

### **Example:**
The following example corresponds to the graphic above.

- **List of rectangles:**

```md
[(9, 8, 9, 3),  (6, 4, 15, 3),  (9, 16, 9, 3),  (6, 20, 15, 3),  (5, 9, 3, 9),  (1, 6, 3, 15),  (19, 9, 3, 9),  (23, 6, 3, 15), (15, 15, 10, 10)]
```

- **Query points:**

```md
(3, 18)   ->  (1, 6, 3, 15)       # Inside a rectangle  
(6, 15)   ->  (5, 9, 3, 9)        # Inside a rectangle  
(10, 11)  ->  (9, 8, 9, 3)        # On the border  
(15, 13)  ->  None                # Outside all rectangles  
(18, 21)  ->  (6, 20, 15, 3)      # Inside multiple, return first
```

### **Input size:**
- There will be 5 performance test cases.
- Each test case will include:
    - Approximately 4,000 rectangles, a mix of randomly generated and specially crafted edge cases.
    - Around 40,000 query points, selected at random.

### **Expected performance**
For Beta phase I've made input size such that the reference solution takes approximately 7s (subject to be reduced based on Beta feedback).

To pass the tests in 12s your solution should be roughly 10x faster than brute-force solution on the data.

## **Solutions:**

#### **Python**
```py
class MouseOver:
    def __init__(self, rectangles):
        self.rectangles = rectangles
        if not rectangles:
            self.grid = None
            return
        min_x = min(r[0] for r in rectangles)
        min_y = min(r[1] for r in rectangles)
        max_x = max(r[0] + r[2] for r in rectangles)
        max_y = max(r[1] + r[3] for r in rectangles)
        self.min_x = min_x
        self.min_y = min_y
        self.max_x = max_x
        self.max_y = max_y
        grid_size = 100
        self.grid_size = grid_size
        self.cell_w = max(1, (max_x - min_x) // grid_size + 1)
        self.cell_h = max(1, (max_y - min_y) // grid_size + 1)
        self.grid = [[[] for _ in range(grid_size)] for _ in range(grid_size)]
        for idx, (x, y, w, h) in enumerate(rectangles):
            gx0 = max(0, (x - min_x) // self.cell_w)
            gx1 = min(grid_size - 1, (x + w - min_x) // self.cell_w)
            gy0 = max(0, (y - min_y) // self.cell_h)
            gy1 = min(grid_size - 1, (y + h - min_y) // self.cell_h)
            for gx in range(gx0, gx1 + 1):
                for gy in range(gy0, gy1 + 1):
                    self.grid[gx][gy].append(idx)
    def find_rectangle(self, x, y):
        if self.grid is None:
            return None
        gx = (x - self.min_x) // self.cell_w
        gy = (y - self.min_y) // self.cell_h
        if gx < 0 or gx >= self.grid_size or gy < 0 or gy >= self.grid_size:
            return None
        candidates = self.grid[gx][gy]
        for idx in candidates:
            rx, ry, rw, rh = self.rectangles[idx]
            if rx <= x <= rx + rw and ry <= y <= ry + rh:
                return self.rectangles[idx]
        return None
```