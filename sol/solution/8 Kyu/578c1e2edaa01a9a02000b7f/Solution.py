# 
# Solution
#
from preloaded import FIRST_NAME, SURNAME
def alias_gen(f_name: str, l_name: str) -> str:
    first_initial = f_name[0].upper()
    last_initial = l_name[0].upper()
    if not first_initial.isalpha() or not last_initial.isalpha():
        return "Your name must start with a letter from A - Z."
    return f"{FIRST_NAME[first_initial]} {SURNAME[last_initial]}"




#
# Sample Tests
# 
import codewars_test as test
from solution import alias_gen

@test.describe("Fixed Tests")
def fixed_tests():
    basic_tests = (
        (('Mike', 'Millington'), 'Malware Mike'),
        (('Fahima', 'Tash'), 'Function T-Rex'),
        (('Daisy', 'Petrovic'), 'Data Payload'),
        (('Barny', 'White'), 'Beta Worm'),
        (('Hank', 'Kutz'), 'Half-life Killer'),
        (('123abc', 'Pinkman'), 'Your name must start with a letter from A - Z.'),
        (('walter', 'white'), 'WiFi Worm')
    )

    for names, result in basic_tests:
        @test.it('{} {}'.format(*names))
        def _():
            test.assert_equals(alias_gen(*names), result)
