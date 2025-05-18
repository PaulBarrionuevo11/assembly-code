section .data
EXIT_SUCCESS    equ     0
SYS_exit        equ     60

section .bss
myArray     resd    10  ; NUmber of elements in the array

section .text
global _start
_start:

mov rax, myArray
mov rcx, 8
xor ebx, ebx
mov dword[rax], 0

myLoop:
add ebx, 2
add rax, 4
mov dword[rax], ebx
loop myLoop

exit:
mov rax, SYS_exit 
mov rdi, EXIT_SUCCESS
syscall



