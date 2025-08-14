/*
* Solution
*/
       identification division.
       program-id. Divisors.
       data division.
       working-storage section.
       01  i           pic 9(6).
       linkage section.
       01  num         pic 9(6).
       01  result.
           03  resLen  pic 9(3) value 0.
           03  res     pic 9(6) occurs 0 to 200 times
                                depending on resLen.
       procedure division using num result.
           initialize result
           move 0 to resLen
           perform varying i from 2 by 1 until i > (num / 2)
               if function mod(num, i) = 0
                   add 1 to resLen
                   move i to res(resLen)
               end-if
           end-perform
           goback.
       end program Divisors.





/*
* Sample Tests
*/
       identification division.
       program-id. tests.
      
       data division.
       working-storage section.
       01  n           pic 9(6).
       01  result.
           03  rl      pic 9(3).
           03  r       pic 9(6) occurs 0 to 500 depending rl.
       01  expected.
           03  el      pic 9(3).
           03  e       pic 9(6) occurs 0 to 500 depending el.
       01  i                 usage index.
       01  x-str             pic x(10).
       01  x-delim           pic x.
       01  fixed-exp         pic x(100).
       01  nDisp             pic z(19)9.
      
       procedure division.
           testsuite 'Fixed tests'.
           move 15 to n
           move '3,5' to fixed-exp
           perform doFixedTest

           move 253 to n
           move '11,23' to fixed-exp
           perform doFixedTest

           move 24 to n
           move '2,3,4,6,8,12' to fixed-exp
           perform doFixedTest

           move 25 to n
           move '5' to fixed-exp
           perform doFixedTest

           move 13 to n
           move 0 to el
           perform doTest

           move 3 to n
           move 0 to el
           perform doTest

           move 29 to n
           move 0 to el
           perform doTest
           end tests.
      
       doFixedTest.
          set el to 0
      
          if fixed-exp <> ' '
              set i to 1
              perform with test after until x-delim = space
                  unstring fixed-exp 
                      delimited by ',' or space 
                      into x-str delimiter in x-delim
                      with pointer i
                  add 1 to el
                  compute e(el) = function numval(x-str)
              end-perform
           end-if
           perform doTest
           .
      
       doTest.
           move n to nDisp
           testcase 'Testing num = ' function trim(nDisp).
           
           call 'Divisors' using 
               by content n
               by reference result
      
           initialize assertion-message
           if expected <> result
              string 'Test failed' into assertion-message
              perform assert-false
              perform displayArrays
           else
              perform assert-true
           end-if
           .
      
       displayArrays.
           if rl = 0
              display 'result   = [ ]'
           else
             display 'result   = [' no advancing
               perform varying i from 1 until i > rl
                 move r(i) to nDisp
                 display function trim(nDisp) no advancing
                 if i < rl display ', ' no advancing
                 else     display ']' end-if
             end-perform
           end-if
      
           if el = 0
              display 'expected = [ ]'
           else
             display 'expected = [' no advancing
               perform varying i from 1 until i > el
                 move e(i) to nDisp
                 display function trim(nDisp) no advancing
                 if i < el display ', ' no advancing
                 else     display ']' end-if
             end-perform
           end-if
           .
      
       end program tests.
      