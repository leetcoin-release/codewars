#
# Solution
#
def count_char_occurrences(strng, char):
    return strng.count(char)





#
# Sample Tests
#
@test.describe("count test")
def tests():
    @test.it("basic tests")
    def basic():
        test.assert_equals(count_char_occurrences("missippi", 'i'), 3)
        test.assert_equals(count_char_occurrences("feed", 'e'), 2)
        test.assert_equals(count_char_occurrences("aaaaaaaa", 'a'), 8)
        test.assert_equals(count_char_occurrences("quicksilver", 'z'), 0)