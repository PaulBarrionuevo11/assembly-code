section .data
array       dd      10, 20, 30, 40, 50, 60, 70, 80, 90, 100 ; Declaring an array of 10 elements
EXIT_SUCCESS equ    0
SYS_exit  equ      60
;--------------------------------------------------

section .text
global _start
_start:

mov rax, array   ; Load address of array
mov rcx, 10      ; Number of elements
xor ebx, ebx     ; Clear register ebx

myLoop:
    add ebx, dword[rax] ; Add current element using rax pointer
    add rax, 4          ; Move to next element
    loop myLoop         ; Decrement rcx and loop until rcx = 0

exit:
    mov rax, SYS_exit       ; Call code for exit
    mov rdi, EXIT_SUCCESS   ; Exit with success status
    syscall