/*
Solution
*/
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





/*
Sample Tests
*/
describe("Tests", () => {
    const chai = require('chai'), { assert } = chai;
    chai.config.truncateThreshold = 0;

  it("test", () => {
var map1=[
["P","D","D"],
["D","W","D"],
["D","D","D"]
]
var path=playPacMan(map1.map(x=>x.slice()),[0,0])
playexample("Example1",map1,path)
assert.deepEqual(checkPath(map1,path),"Passed")


var map2=[
["D","P","D","D","D"],
["D","W","D","W","D"],
["D","E","D","E","D"],
["D","W","D","W","D"],
["D","D","D","D","D"]
]
var path=playPacMan(map2.map(x=>x.slice()),[0,1])
playexample("Example2",map2,path)
assert.deepEqual(checkPath(map2,path),"Passed")

var map3=[
["D","D","D","P","D"],
["D","W","D","W","D"],
["D","E","D","E","D"],
["D","W","D","W","D"],
["D","D","D","D","D"]
]
var path=playPacMan(map3.map(x=>x.slice()),[0,3])
playexample("Example3",map3,path)
assert.deepEqual(checkPath(map3,path),"Passed")


var map4=[
["P","E","D","D","D","D","D","D","D","D","D","D","D","D","D","D","D","D","D","D","D"],
["D","W","D","W","E","W","E","W","E","W","E","W","E","W","E","W","E","W","E","W","D"],
["D","E","D","E","E","E","E","E","E","E","E","E","E","E","E","E","E","E","E","E","D"],
["D","W","D","W","E","W","E","W","E","W","E","W","E","W","E","W","E","W","E","W","D"],
["D","E","D","E","E","E","E","E","E","E","E","E","E","E","E","E","E","E","E","E","D"],
["D","W","D","W","E","W","E","W","E","W","E","W","E","W","E","W","E","W","E","W","D"],
["D","E","D","E","E","E","E","E","E","E","E","E","E","E","E","E","E","E","E","E","D"],
["D","W","D","W","E","W","E","W","E","W","E","W","E","W","E","W","E","W","E","W","D"],
["D","E","D","E","E","E","E","E","E","E","E","E","E","E","E","E","E","E","E","E","D"],
["D","W","D","W","E","W","E","W","E","W","E","W","E","W","E","W","E","W","E","W","D"],
["D","E","D","E","E","E","E","E","E","E","E","E","E","E","E","E","E","E","E","E","D"],
["D","W","D","W","E","W","E","W","E","W","E","W","E","W","E","W","E","W","E","W","D"],
["D","E","D","E","E","E","E","E","E","E","E","E","E","E","E","E","E","E","E","E","D"],
["D","W","D","W","E","W","E","W","E","W","E","W","E","W","E","W","E","W","E","W","D"],
["D","D","D","D","D","D","D","D","D","D","D","D","D","D","D","D","D","D","D","D","D"]
]
var path=playPacMan(map4.map(x=>x.slice()),[0,0])
playexample("Example4",map4,path)
assert.deepEqual(checkPath(map4,path),"Passed")

var map5=[
["D","D","D"],
["E","P","E"],
["E","E","E"]
]
var path=playPacMan(map5.map(x=>x.slice()),[1,1])
assert.deepEqual(path,"no solution")

var map6=[
["E","D","D"],
["E","P","D"],
["D","E","D"]
]
var path=playPacMan(map6.map(x=>x.slice()),[1,1])
assert.deepEqual(path,"no solution")

  });
});