# [**Count Connectivity Components**](https://www.codewars.com/kata/5856f3ecf37aec45e6000091)

## **Description:**

The following figure shows a cell grid with 6 cells (2 rows by 3 columns), each cell separated from the others by walls:

```md
+--+--+--+
|  |  |  |
+--+--+--+
|  |  |  |
+--+--+--+
```

This grid has 6 connectivity components of size 1. We can describe the size and number of connectivity components by the list `[(1, 6)]`, since there are 6 components of size 1.

If we tear down a couple of walls, we obtain:

```md
+--+--+--+
|  |     |
+  +--+--+
|  |  |  |
+--+--+--+
```

, which has two connectivity components of size 2 and two connectivity components of size 1. The size and number of connectivity components is described by the list `[(2, 2), (1, 2)]`.

Given the following grid:

```md
+--+--+--+
|     |  |
+  +--+--+
|     |  |
+--+--+--+
```

we have the connectivity components described by `[(4, 1), (1, 2)]`.

Your job is to define a function `components(grid)` that takes as argument a string representing a grid like in the above pictures and returns a list describing the size and number of the connectivity components. The list should be sorted in descending order by the size of the connectivity components. The grid may have any number of rows and columns.

Note: The grid is always rectangular and will have all its outer walls. Only inner walls may be missing. The `+` are considered bearing pillars, and are always present.

## **Solutions:**

#### **Python**
```py
from collections import deque, Counter
def components(grid: str) -> list[tuple[int, int]]:
    lines = grid.splitlines()
    if not lines:
        return []
    h = (len(lines) - 1) // 2
    w = (len(lines[0]) - 1) // 3
    chars = [list(line) for line in lines]
    def right_wall(r, c):
        return chars[2 * r + 1][3 * (c + 1)] == '|'
    def bottom_wall(r, c):
        a = chars[2 * (r + 1)][1 + 3 * c]
        b = chars[2 * (r + 1)][2 + 3 * c]
        return (a == '-') or (b == '-')
    visited = [[False] * w for _ in range(h)]
    sizes = []
    for r in range(h):
        for c in range(w):
            if visited[r][c]:
                continue
            q = deque([(r, c)])
            visited[r][c] = True
            size = 0
            while q:
                rr, cc = q.popleft()
                size += 1
                if rr > 0 and (not bottom_wall(rr - 1, cc)) and not visited[rr - 1][cc]:
                    visited[rr - 1][cc] = True
                    q.append((rr - 1, cc))
                if rr < h - 1 and (not bottom_wall(rr, cc)) and not visited[rr + 1][cc]:
                    visited[rr + 1][cc] = True
                    q.append((rr + 1, cc))
                if cc > 0 and (not right_wall(rr, cc - 1)) and not visited[rr][cc - 1]:
                    visited[rr][cc - 1] = True
                    q.append((rr, cc - 1))
                if cc < w - 1 and (not right_wall(rr, cc)) and not visited[rr][cc + 1]:
                    visited[rr][cc + 1] = True
                    q.append((rr, cc + 1))
            sizes.append(size)
    counts = Counter(sizes)
    result = sorted(((size, counts[size]) for size in counts), key=lambda x: -x[0])
    return result
```