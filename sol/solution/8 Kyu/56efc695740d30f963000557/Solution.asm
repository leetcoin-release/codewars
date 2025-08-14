;
; Solution
;
; to_alternating_case.asm
; Linux x86-64 NASM syntax
; Compile: nasm -f elf64 to_alternating_case.asm && gcc -no-pie -o test test.c to_alternating_case.o

extern malloc
section .text
global to_alternating_case

to_alternating_case:
    ; RDI = const char *input

    push rdi                   ; save pointer for later
    xor rcx, rcx               ; length counter

.len_loop:
    cmp byte [rdi + rcx], 0
    je .len_done
    inc rcx
    jmp .len_loop

.len_done:
    inc rcx                    ; include null terminator
    mov rdi, rcx               ; malloc argument = length
    call malloc
    mov rsi, rax               ; rsi = dest
    pop rdi                    ; rdi = src

    xor rdx, rdx               ; index = 0

.copy_loop:
    mov al, [rdi + rdx]        ; load char
    cmp al, 0
    je .done_copy

    cmp al, 'a'
    jb .check_upper            ; if < 'a', maybe uppercase
    cmp al, 'z'
    jg .check_upper            ; if > 'z', maybe uppercase
    sub al, 32                 ; lowercase → uppercase
    jmp .store_char

.check_upper:
    cmp al, 'A'
    jb .store_char
    cmp al, 'Z'
    jg .store_char
    add al, 32                 ; uppercase → lowercase

.store_char:
    mov [rsi + rdx], al
    inc rdx
    jmp .copy_loop

.done_copy:
    mov byte [rsi + rdx], 0    ; null terminate
    mov rax, rsi               ; return pointer
    ret





;
; Sample Tests
;
#include <criterion/criterion.h>

char *to_alternating_case(const char *);

Test(to_alternating_case, should_work_for_all_fixed_assertions_provided_in_kata_description) {
  cr_assert_str_eq(to_alternating_case("hello world"), "HELLO WORLD");
  cr_assert_str_eq(to_alternating_case("HELLO WORLD"), "hello world");
  cr_assert_str_eq(to_alternating_case("hello WORLD"), "HELLO world");
  cr_assert_str_eq(to_alternating_case("HeLLo WoRLD"), "hEllO wOrld");
  cr_assert_str_eq(to_alternating_case("12345"), "12345");
  cr_assert_str_eq(to_alternating_case("1a2b3c4d5e"), "1A2B3C4D5E");
  cr_assert_str_eq(to_alternating_case("String.prototype.toAlternatingCase"), "sTRING.PROTOTYPE.TOaLTERNATINGcASE");
}