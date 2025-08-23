#
# Solution
#
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





#
# Sample Tests
#
from solution import components
import codewars_test as test

@test.describe('Tests')
def _():

    def do_test(input, expected):
        message = f"for grid =\n{input}\n"
        actual = components(input)
        test.assert_equals(actual, expected, message)

    @test.it('Example Test Cases')
    def _():
        do_test(
        '+--+--+--+' '\n'
        '|  |  |  |' '\n'
        '+--+--+--+' '\n'
        '|  |  |  |' '\n'
        '+--+--+--+', [(1, 6)])

        do_test(
        '+--+--+--+' '\n'
        '|  |     |' '\n'
        '+  +  +--+' '\n'
        '|  |  |  |' '\n'
        '+--+--+--+', [(3, 1), (2, 1), (1, 1)])

        do_test(
        '+--+--+--+' '\n'
        '|  |     |' '\n'
        '+  +  +--+' '\n'
        '|        |' '\n'
        '+--+--+--+', [(6, 1)])

        do_test(
        '+--+--+--+' '\n'
        '|        |' '\n'
        '+  +  +  +' '\n'
        '|        |' '\n'
        '+--+--+--+', [(6, 1)])