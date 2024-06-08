;
; file: asm_io.asm
; Assembly I/O routines

default rel

segment .data

int_format          db  "%i", 0
string_format       db  "%s", 0

segment .text

global  read_int, print_int
extern  scanf, printf, getchar, putchar

read_int:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 8

    mov     rdi, int_format         ; first argument (format string) in rdi
    mov     rsi, rbp                ; second argument (address of int) in rsi
    xor     rax, rax                ; clear rax (no floating-point arguments)
    call    scanf                   ; TODO: check error

    mov     rax, [rbp]              ; load the read integer into rax
    add     rsp, 8
    pop     rbp
    ret

print_int:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 8

    mov     rsi, rdi                ; first argument in rdi will be used as second argument in rsi when calling printf
    mov     rdi, int_format         ; first argument (format string) in rdi
    xor     rax, rax                ; clear rax (no floating-point arguments)
    call    printf                  ; TODO: check error

    add     rsp, 8
    pop     rbp
    ret


