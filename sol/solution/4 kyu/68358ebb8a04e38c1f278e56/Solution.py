#
# Solution
#
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





#
# Sample Tests
#
from solution import MouseOver
from preloaded import describe,it,assert_equals;

@describe("basic tests")
def tests():
    rectangles = [(9, 8, 9, 3),  (6, 4, 15, 3),  (9, 16, 9, 3),  (6, 20, 15, 3),  (5, 9, 3, 9),  (1, 6, 3, 15),  (19, 9, 3, 9),  (23, 6, 3, 15), (15, 15, 10, 10)]    
    mouse_over = MouseOver(rectangles)
    
    @it("point inside rectangle")
    def test_inside_rectangle():
        test.assert_equals(mouse_over.find_rectangle(3, 18), (1, 6, 3, 15))
        test.assert_equals(mouse_over.find_rectangle(6, 15), (5, 9, 3, 9))
        
    @it("point on the border")
    def test_on_the_border():
        test.assert_equals(mouse_over.find_rectangle(10, 11), (9, 8, 9, 3))

    @it("point outside")
    def test_on_the_outside():
        test.assert_equals(mouse_over.find_rectangle(15, 13), None)

    @it("point inside multiple rectangles")
    def test_inside_multiple():
        test.assert_equals(mouse_over.find_rectangle(18, 21), (6, 20, 15, 3))