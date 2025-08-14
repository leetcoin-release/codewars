/*
* Solution
*/
#include <stddef.h>
void divisors(unsigned n, size_t *length, unsigned array[]) {
    *length = 0; 
    for (unsigned i = 2; i <= n / 2; i++) {
        if (n % i == 0) {        
            array[*length] = i;  
            (*length)++;           
        }
    }
}





/*
* Sample Tests
*/
#include <criterion/criterion.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

extern void divisors(unsigned n, size_t *length, unsigned array[]);
static void tester(unsigned n, size_t length, const unsigned expected[length]);

Test(Sample_Tests, should_pass_all_tests)
{
  { unsigned n =  15; const unsigned expected[2] = {3, 5};              tester(n, 2, expected); }
  { unsigned n = 253; const unsigned expected[2] = {11, 23};            tester(n, 2, expected); }
  { unsigned n =  24; const unsigned expected[6] = {2, 3, 4, 6, 8, 12}; tester(n, 6, expected); }
  { unsigned n =  25; const unsigned expected[1] = {5};                 tester(n, 1, expected); }
  { unsigned n =  13; const unsigned *expected = NULL;                  tester(n, 0, expected); }
  { unsigned n =   3; const unsigned *expected = NULL;                  tester(n, 0, expected); }
  { unsigned n =  29; const unsigned *expected = NULL;                  tester(n, 0, expected); }
}

static void print_array (size_t length, const unsigned array[length]) {
	printf("{");
	for (size_t i = 0; i < length; i++)
		printf("%u%s", array[i], (i == length - 1) ? "" : ", ");
	printf("}");
}

static void tester(unsigned n, size_t exp_len, const unsigned expected[exp_len]) {
    const size_t mem_size = exp_len * sizeof *expected;
	unsigned *actual = malloc(mem_size);

	size_t act_len = 666;
	divisors(n, &act_len, actual);

	if (act_len != exp_len || memcmp(actual, expected, mem_size)) {
		printf("expected array[%zu]:  ", exp_len);
		print_array(exp_len, expected);
		printf("\nbut got  array[%zu]:  ", act_len);
		print_array(act_len, actual);
        fflush(stdout);
	}
	cr_assert_eq(act_len, exp_len,
		"for n = %u there should be %zu divisors, but got %zu",
		n, exp_len, act_len
	);
	cr_assert_arr_eq(actual, expected, mem_size,
		"incorrect divisors for n = %u", n
	);
	free(actual);
}