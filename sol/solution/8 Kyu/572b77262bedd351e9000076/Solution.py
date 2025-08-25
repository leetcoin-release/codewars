#
# Solution
#
def first(seq, n=1):
    if n == 0:
        return []
    return seq[:n]





#
# Sample Tests
#
@test.describe('Example Tests')
def example_tests():
    seq = ['a', 'b', 'c', 'd', 'e']
    test.assert_equals(first(seq), ['a'])
    test.assert_equals(first(seq, 0), []);
    test.assert_equals(first(seq, 1), ['a']);
    test.assert_equals(first(seq, 2), ['a', 'b']);
    test.assert_equals(first(seq, 10), ['a', 'b', 'c', 'd', 'e'])