# [**Play PacMan : Devour all**](https://www.codewars.com/kata/575c29d5fcee86cb8b000136)

## **Description:**

### **lay PacMan : Devour all**

### **About PacMan**

<img src="https://upload.wikimedia.org/wikipedia/en/thumb/5/59/Pac-man.png/200px-Pac-man.png" style="width: 100%; height: 600;"/>

Welcome to Pac-Man's world! Pac-Man is a classic game, you can look at here for more information.

### **Task**

Your should coding in function `playPacMan`. Function accept two parameters:

The first parameter is `map`, it's a 2D array, like this:

```md
[
["D","D","P"],
["D","W","E"],
["D","D","D"]
]
```

It's Pac-Man's game map. `P` is the initial position of Pacman. `D` is dots(or bean?), Pacman's favorite thing to eat. `W` is wall. `E` is empty place.

The second parameter is `postion`(That's where the `P` is), it is the starting point of Pac-Man.

Your task is to find a way to eat up all the dots. Returns an array containing all of the path coordinates. Like the example above, it should return:

```md
[[0,2],[0,1],[0,0],[1,0],[2,0],[2,1],[2,2]]
```

Please note:

1. Each coordinate array contains two numbers, the first one is the row coordinate, and the second is the column coordinate.
2. Pac-Man only eat dots, the return of the coordinates must be the coordinates of dots, and must eat all the dots.
3. If you can not find the path to eat all the dots, please return "no solution"

#### **Classic Games Series**
- [**Play Tetris : Shape anastomosis**](http://www.codewars.com/kata/56c85eebfd8fc02551000281)
- [**Play FlappyBird : Advance Bravely**](http://www.codewars.com/kata/play-flappybird-advance-bravely)
- [**Play PingPong : Precise control**](http://www.codewars.com/kata/57542b169a4524d7d9000b68)
- [**Play PacMan : Devour all**](https://www.codewars.com/kata/575c29d5fcee86cb8b000136)
- [**Play PacMan 2: The way home**](https://www.codewars.com/kata/575ed46e23891f67d90000d8)

## **Solutions:**

#### **Javascript**
```js
function playPacMan(map, position) {
  const rows = map.length;
  const cols = map[0].length;
  const directions = [
    [0, 1], [1, 0], [0, -1], [-1, 0]
  ];
  const totalDots = map.flat().filter(cell => cell === 'D' || cell === 'P').length;
  const visited = Array.from({ length: rows }, () => Array(cols).fill(false));
  let path = [];
  let found = false;
  function dfs(x, y, dotsLeft, currPath) {
    if (x < 0 || x >= rows || y < 0 || y >= cols) return;
    if (map[x][y] === 'W' || visited[x][y]) return;
    if (map[x][y] === 'E') return;
    visited[x][y] = true;
    currPath.push([x, y]);
    if (map[x][y] === 'D' || map[x][y] === 'P') dotsLeft--;
    if (dotsLeft === 0) {
      path = currPath.slice();
      found = true;
      visited[x][y] = false;
      currPath.pop();
      return;
    }
    for (const [dx, dy] of directions) {
      if (found) break;
      dfs(x + dx, y + dy, dotsLeft, currPath);
    }
    visited[x][y] = false;
    currPath.pop();
  }
  dfs(position[0], position[1], totalDots, []);
  return found ? path : "no solution";
}
```