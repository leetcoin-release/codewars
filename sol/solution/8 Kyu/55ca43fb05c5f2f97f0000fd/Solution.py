#
# Solution
#
def list_animals(animals):
    lst = ''
    for i in range(len(animals)):
        lst += str(i + 1) + '. ' + animals[i] + '\n'
    return lst





#
# Sample Tests
#
import codewars_test as test
from solution import list_animals

@test.describe("Fixed Tests")
def fixed_tests():
    @test.it('Basic Test Cases')
    def basic_test_cases():
        animals = [ 'dog', 'cat', 'elephant' ]
        test.assert_equals(list_animals(animals), '1. dog\n2. cat\n3. elephant\n')

        animals = [ 'bird', 'parrot', 'elephant', 'giraffe' ]
        test.assert_equals(list_animals(animals), '1. bird\n2. parrot\n3. elephant\n4. giraffe\n')

        animals = [ 'pig', 'frog', 'hamster', 'mouse', 'sloth' ]
        test.assert_equals(list_animals(animals), '1. pig\n2. frog\n3. hamster\n4. mouse\n5. sloth\n')

        animals = [ 'cow', 'horse', 'pig', 'donkey', 'buffalo', 'turtle', 'chicken' ]
        test.assert_equals(list_animals(animals), '1. cow\n2. horse\n3. pig\n4. donkey\n5. buffalo\n6. turtle\n7. chicken\n')