/*
* Solution
*/
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
char *to_alternating_case(const char *s) {
    size_t len = strlen(s);
    char *result = (char *)calloc(len + 1, sizeof(char));
    if (!result) {
        return NULL;
    }
    for (size_t i = 0; i < len; i++) {
        if (islower(s[i])) {
            result[i] = toupper(s[i]);
        } else if (isupper(s[i])) {
            result[i] = tolower(s[i]);
        } else {
            result[i] = s[i];
        }
    }
    result[len] = '\0';
    return result;
}





/*
* Sample Tests
*/
#include <criterion/criterion.h>
#include <stdlib.h>

char *to_alternating_case(const char *);
static void do_test(const char *input, const char *expected);

Test(to_alternating_case, sample_tests) {
    do_test("", "");
    do_test("hello world", "HELLO WORLD");
    do_test("HELLO WORLD", "hello world");
    do_test("hello WORLD", "HELLO world");
    do_test("HeLLo WoRLD", "hEllO wOrld");
    do_test("12345", "12345");
    do_test("1a2b3c4d5e", "1A2B3C4D5E");
}

static void do_test(const char *input, const char *expected) {
    char *actual = to_alternating_case(input);
    cr_assert_str_eq(actual, expected,
        "input    = \"%s\"\nexpected = \"%s\"\nactual   = \"%s\"",
        input, expected, actual
    );
    free(actual);
}