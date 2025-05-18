; QUIZ #3 - Assembly Lenguage
; Author: Paul Barrionuevo
; Simulate push/pop using rax, rbx, rcx

section .data
EXIT_SUCCESS    equ    0
SYS_exit        equ    60

numbers         dq      1, 2, 3
len             dq      3

section .text
global _start
_start:

    mov     rdi, numbers

    ; Push instructions
    mov     rax, [rdi]         ; First value of array = 1
    sub     rsp, 8
    mov     [rsp], rax

    mov     rbx, [rdi + 8]     ; Second value of array = 2
    sub     rsp, 8
    mov     [rsp], rbx

    mov     rcx, [rdi + 16]    ; Third value of array = 3
    sub     rsp, 8
    mov     [rsp], rcx

    ; Pop instructions
    mov     rax, [rsp]
    add     rsp, 8
    mov     [rdi], rax         ; Third value of array = 3

    mov     rbx, [rsp]
    add     rsp, 8
    mov     [rdi + 8], rbx     ; Second value of array = 2

    mov     rcx, [rsp]
    add     rsp, 8
    mov     [rdi + 16], rcx    ; First value of array = 1

    
    exit: 
        mov     rax, SYS_exit
        mov     rdi, EXIT_SUCCESS
        syscall

