!
! Solution
!
USING: kernel sequences math math.order ascii ;
IN: kata
: swap-case ( ch -- ch' )
    dup CHAR: a CHAR: z between?
    [ 32 - ]                           ! lowercase -> uppercase
    [ dup CHAR: A CHAR: Z between?
        [ 32 + ]                       ! uppercase -> lowercase
        [ ]                            ! non-alpha unchanged
      if
    ] if ;
: >alternating ( str -- new-str )
    [ swap-case ] map ;





!
! Sample Tests
!
USING: kata tools.testest ;
IN: kata.tests

: run-tests ( -- )
  "Alternating case" describe#{
    "Basic tests" it#{
      <{ "hello world" >alternating -> "HELLO WORLD" }>
      <{ "HELLO WORLD" >alternating -> "hello world" }>
      <{ "hello WORLD" >alternating -> "HELLO world" }>
      <{ "HeLLo WoRLD" >alternating -> "hEllO wOrld" }>
      <{ "12345" >alternating -> "12345" }>
      <{ "1a2b3c4d5e" >alternating -> "1A2B3C4D5E" }>
      <{ "String.prototype.toAlternatingCase" >alternating -> "sTRING.PROTOTYPE.TOaLTERNATINGcASE" }>
      <{ "Hello World" >alternating >alternating -> "Hello World" }>
    }#
    "should work for the title of this Kata" it#{
      <{ "altERnaTIng cAsE" >alternating >alternating >alternating -> "ALTerNAtiNG CaSe" }>
      <{ "ALTerNAtiNG CaSe" >alternating >alternating >alternating -> "altERnaTIng cAsE" }>
      <{ "altERnaTIng cAsE <=> ALTerNAtiNG CaSe" >alternating >alternating >alternating -> "ALTerNAtiNG CaSe <=> altERnaTIng cAsE" }>
      <{ "ALTerNAtiNG CaSe <=> altERnaTIng cAsE" >alternating >alternating >alternating -> "altERnaTIng cAsE <=> ALTerNAtiNG CaSe" }>
    }#
  }#
;

MAIN: run-tests