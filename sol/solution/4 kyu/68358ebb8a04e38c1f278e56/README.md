# [**Mouse Over (x,y) (Performance Version)**](https://www.codewars.com/kata/68358ebb8a04e38c1f278e56)

## **Description:**

You are tasked with implementing a `MouseOver(x, y)` functionality.

**This is a performance version of** [this kata](https://www.codewars.com/kata/68356baf60410813d358bb2c).

Given a list of rectangles displayed on a screen, your program must process a series of queries to determine which rectangle, if any, contains a given point.

In the graphic below, you can see examples of a point inside a rectangle, one on the border, one inside two overlapping rectangles, and one outside any rectangle.

<svg viewBox="0 0 28 25" height="600px;" width="100%" xmlns="http://www.w3.org/2000/svg">
    <g stroke-width="0.01" stroke="lightgray">
        <line y2="25" x2="0" y1="0" x1="0"></line>
        <line y2="25" x2="1" y1="0" x1="1"></line>
        <line y2="25" x2="2" y1="0" x1="2"></line>
        <line y2="25" x2="3" y1="0" x1="3"></line>
        <line y2="25" x2="4" y1="0" x1="4"></line>
        <line y2="25" x2="5" y1="0" x1="5"></line>
        <line y2="25" x2="6" y1="0" x1="6"></line>
        <line y2="25" x2="7" y1="0" x1="7"></line>
        <line y2="25" x2="8" y1="0" x1="8"></line>
        <line y2="25" x2="9" y1="0" x1="9"></line>
        <line y2="25" x2="10" y1="0" x1="10"></line>
        <line y2="25" x2="11" y1="0" x1="11"></line>
        <line y2="25" x2="12" y1="0" x1="12"></line>
        <line y2="25" x2="13" y1="0" x1="13"></line>
        <line y2="25" x2="14" y1="0" x1="14"></line>
        <line y2="25" x2="15" y1="0" x1="15"></line>
        <line y2="25" x2="16" y1="0" x1="16"></line>
        <line y2="25" x2="17" y1="0" x1="17"></line>
        <line y2="25" x2="18" y1="0" x1="18"></line>
        <line y2="25" x2="19" y1="0" x1="19"></line>
        <line y2="25" x2="20" y1="0" x1="20"></line>
        <line y2="25" x2="21" y1="0" x1="21"></line>
        <line y2="25" x2="22" y1="0" x1="22"></line>
        <line y2="25" x2="23" y1="0" x1="23"></line>
        <line y2="25" x2="24" y1="0" x1="24"></line>
        <line y2="25" x2="25" y1="0" x1="25"></line>
        <line y2="25" x2="26" y1="0" x1="26"></line>
        <line y2="25" x2="27" y1="0" x1="27"></line>
        <line y2="25" x2="28" y1="0" x1="28"></line>
        <line y2="0" x2="28" y1="0" x1="0"></line>
        <line y2="1" x2="28" y1="1" x1="0"></line>
        <line y2="2" x2="28" y1="2" x1="0"></line>
        <line y2="3" x2="28" y1="3" x1="0"></line>
        <line y2="4" x2="28" y1="4" x1="0"></line>
        <line y2="5" x2="28" y1="5" x1="0"></line>
        <line y2="6" x2="28" y1="6" x1="0"></line>
        <line y2="7" x2="28" y1="7" x1="0"></line>
        <line y2="8" x2="28" y1="8" x1="0"></line>
        <line y2="9" x2="28" y1="9" x1="0"></line>
        <line y2="10" x2="28" y1="10" x1="0"></line>
        <line y2="11" x2="28" y1="11" x1="0"></line>
        <line y2="12" x2="28" y1="12" x1="0"></line>
        <line y2="13" x2="28" y1="13" x1="0"></line>
        <line y2="14" x2="28" y1="14" x1="0"></line>
        <line y2="15" x2="28" y1="15" x1="0"></line>
        <line y2="16" x2="28" y1="16" x1="0"></line>
        <line y2="17" x2="28" y1="17" x1="0"></line>
        <line y2="18" x2="28" y1="18" x1="0"></line>
        <line y2="19" x2="28" y1="19" x1="0"></line>
        <line y2="20" x2="28" y1="20" x1="0"></line>
        <line y2="21" x2="28" y1="21" x1="0"></line>
        <line y2="22" x2="28" y1="22" x1="0"></line>
        <line y2="23" x2="28" y1="23" x1="0"></line>
        <line y2="24" x2="28" y1="24" x1="0"></line>
        <line y2="25" x2="28" y1="25" x1="0"></line>
    </g>
    <rect stroke-width="0.3" stroke="blue" fill="none" height="10" width="10" y="15" x="15"></rect>
    <rect stroke-width="0.3" stroke="gold" fill="none" height="3" width="9" y="8" x="9"></rect>
    <rect stroke-width="0.3" stroke="blue" fill="none" height="3" width="15" y="4" x="6"></rect>
    <rect stroke-width="0.3" stroke="blue" fill="none" height="3" width="9" y="16" x="9"></rect>
    <rect stroke-width="0.3" stroke="gold" fill="none" height="3" width="15" y="20" x="6"></rect>
    <rect stroke-width="0.3" stroke="gold" fill="none" height="9" width="3" y="9" x="5"></rect>
    <rect stroke-width="0.3" stroke="gold" fill="none" height="15" width="3" y="6" x="1"></rect>
    <rect stroke-width="0.3" stroke="blue" fill="none" height="9" width="3" y="9" x="19"></rect>
    <rect stroke-width="0.3" stroke="blue" fill="none" height="15" width="3" y="6" x="23"></rect>
    <circle fill="gold" r="0.5" cy="18" cx="3"></circle>
    <circle fill="gold" r="0.5" cy="15" cx="6"></circle>
    <circle fill="gold" r="0.5" cy="11" cx="10"></circle>
    <circle fill="blue" r="0.5" cy="13" cx="15"></circle>
    <circle fill="gold" r="0.5" cy="21" cx="18"></circle>
</svg>

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