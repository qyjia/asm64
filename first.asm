;
; file: first.asm
; First assembly program. This program asks for two integers as
; input and prints out their sum.
;
; To create executable:
;
; Using Linux and gcc:
; nasm -f elf64 -o asm64_io.o asm64_io.asm
; nasm -f elf64 -o first.o first.asm
; gcc -fno-pie -no-pie -c -o driver.o driver.c
; gcc -fno-pie -no-pie -o first asm64_io.o first.o driver.c 

%include "asm64_io.inc"


;
; initialized data is put in the .data segment
;
segment .data


;
; uninitialized data is put in the .bss segment
;
segment .bss

input1  resd 1
input2  resd 1

 
;
; code is put in the .text segment
;
segment .text
        global  asm_main
asm_main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 8

        call    read_int                ; read integer
        mov     qword [rel input1], rax ; store into input1

        call    read_int                ; read integer
        mov     qword [rel input2], rax ; store into input2

        mov     rax, qword [rel input1] ; rax = dword at input1
        add     rax, qword [rel input2] ; rax += dword at input2
        mov     rdi, rax                ; rdi = rax
        call    print_int

        mov     rax, 0                  ; return back to C
        add     rsp, 8
        pop     rbp
        ret

