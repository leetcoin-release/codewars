#
# Solution
#
import math
def circle_circumference(circle):
    return 2 * math.pi * circle.radius





#
# Sample Tests
#
import codewars_test as test
from solution import circle_circumference
from preloaded import Point, Circle

@test.describe("Fixed Tests")
def fixed_tests():
    @test.it('Basic Test Cases')
    def basic_test_cases():
        test.assert_equals(round(circle_circumference(Circle(Point(10, 10), 30)), 6), 188.495559)
        test.assert_equals(round(circle_circumference(Circle(Point(25, -70), 30)), 6), 188.495559)
        test.assert_equals(round(circle_circumference(Circle(Point(-15, 5), 0)), 6), 0)
        test.assert_equals(round(circle_circumference(Circle(Point(-15, 5), 12.5)), 6), 78.539816)