/*
* Solution
*/
        IDENTIFICATION DIVISION.
        PROGRAM-ID. ALTERNATING-CASE.
        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01  I                PIC 9(3).
        LINKAGE SECTION.
        01  S.
            03 S-LENGTH      PIC 9(3).
            03 S-CHARS.
                05 S-CHAR    PIC A OCCURS 1 TO 200 TIMES 
                                DEPENDING ON S-LENGTH.
        01  RESULT.
            03 RES-LENGTH    PIC 9(3).
            03 RES-CHARS.
                05 RES-CHAR  PIC A OCCURS 1 TO 200 TIMES 
                                DEPENDING ON RES-LENGTH.
        PROCEDURE DIVISION USING S RESULT.
            MOVE S-LENGTH TO RES-LENGTH
            PERFORM VARYING I FROM 1 BY 1 UNTIL I > S-LENGTH
                EVALUATE TRUE
                    WHEN S-CHAR(I) >= 'a' AND S-CHAR(I) <= 'z'
                        MOVE FUNCTION UPPER-CASE(S-CHAR(I)) 
                            TO RES-CHAR(I)
                    WHEN S-CHAR(I) >= 'A' AND S-CHAR(I) <= 'Z'
                        MOVE FUNCTION LOWER-CASE(S-CHAR(I)) 
                            TO RES-CHAR(I)
                    WHEN OTHER
                        MOVE S-CHAR(I) TO RES-CHAR(I)
                END-EVALUATE
            END-PERFORM
            GOBACK.
        END PROGRAM ALTERNATING-CASE.





/*
* Sample Tests
*/
        identification division.
        program-id. tests.

        data division.
        working-storage section.
        01  test1 constant 'hello world'.
        01  expt1 constant 'HELLO WORLD'.
        01  test2 constant 'HELLO WORLD'.
        01  expt2 constant 'hello world'.
        01  test3 constant 'hello WORLD'.
        01  expt3 constant 'HELLO world'.
        01  test4 constant '12345'.
        01  expt4 constant '12345'.
        01  test5 constant '1a2b3c4d5e'.
        01  expt5 constant '1A2B3C4D5E'.
        01  expected.
            03 xp-length      pic 9(3).
            03 xp-chars.
                05 xp-char pic a occurs 1 to 200 times
                                depending on xp-length.
        01  s.
            03 s-length       pic 9(3).
            03 s-chars.
                05 s-char pic a occurs 1 to 200 times 
                                depending on s-length.
        01  s-copy.
            03 s-copy-length  pic 9(3).
            03 s-copy-chars.
                05 s-char pic a occurs 1 to 200 times 
                                depending on s-copy-length.
        01  result.
            03 res-length      pic 9(3).
            03 res-chars.
                05 res-char pic a occurs 1 to 200 times 
                                depending on res-length.
        01  a-disp             pic z(19)9.
        01  b-disp             pic z(19)9.

        procedure division.
            testsuite 'Basic Tests'.
            move length of test1 to s-length
            move test1 to s-chars
            move length of expt1 to xp-length
            move expt1 to xp-chars
            perform dotest

            move length of test2 to s-length
            move test2 to s-chars
            move length of expt2 to xp-length
            move expt2 to xp-chars
            perform dotest
        
            move length of test3 to s-length
            move test3 to s-chars
            move length of expt3 to xp-length
            move expt3 to xp-chars
            perform dotest
        
            move length of test4 to s-length
            move test4 to s-chars
            move length of expt4 to xp-length
            move expt4 to xp-chars
            perform dotest

            move length of test5 to s-length
            move test5 to s-chars
            move length of expt5 to xp-length
            move expt5 to xp-chars
            perform dotest
        
            end tests.

        dotest.
            testcase 'Testing "' s-chars '"'.
            move s to s-copy
            call 'ALTERNATING-CASE' using s result
        
            evaluate true
                when s <> s-copy
                    move 'The input string should not be modified' to
                        assertion-message
                    perform assert-false
                when res-chars = xp-chars
                    initialize assertion-message
                    if res-length <> xp-length
                    move res-length to a-disp
                    move xp-length to b-disp
                    string 'Expected and actual have different lengths' 
                        line-feed
                        'expected: ' function trim(b-disp)
                        line-feed
                        'actual:   ' function trim(a-disp)
                        into assertion-message
                    perform assert-false
                    else
                    perform assert-true
                    end-if
                when other
                    expect res-chars to be xp-chars.
            end-evaluate
            .

        end program tests.
      