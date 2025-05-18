section .data
SYS_write       equ     1
STDOUT          equ     1
SYS_exit        equ     60
EXIT_SUCCESS    equ     0

msg             dq      "Hello world"
msgLen          dq       11

section .text
global _start
_start:

mov rax, SYS_write
mov rdi, STDOUT
mov rsi, msg
mov rdx, qword[msgLen]
syscall


; Exit the program
    mov     rax, SYS_exit
    mov     rdi, EXIT_SUCCESS
    syscall