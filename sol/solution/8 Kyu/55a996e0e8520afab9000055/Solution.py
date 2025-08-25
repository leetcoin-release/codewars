#
# Solution
#
def cookie(x):
    if isinstance(x, str):
        name = "Zach"
    elif isinstance(x, bool):  
        name = "the dog"
    elif isinstance(x, (int, float)):
        name = "Monica"
    else:
        name = "the dog"
    return f"Who ate the last cookie? It was {name}!"





#
# Sample Tests
#
from solution import cookie
import codewars_test as test

@test.describe("Basic tests")
def basic_tests():
    
    @test.it("Examples")
    def examples():   
        test.assert_equals(cookie("Ryan"), "Who ate the last cookie? It was Zach!")
        test.assert_equals(cookie(2.3), "Who ate the last cookie? It was Monica!")
        test.assert_equals(cookie(26), "Who ate the last cookie? It was Monica!")
        test.assert_equals(cookie(True), "Who ate the last cookie? It was the dog!")