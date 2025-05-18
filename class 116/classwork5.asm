section .data
EXIT_SUCCESS equ    0
SYS_exit  equ      60
;--------------------------------------------------

section .bss
array       resd     10


section .text
global _start
_start:

mov rax, array   ; Load address of array
mov rcx, 10      ; Number of elements
xor ebx, ebx     ; Clear register ebx
mov dword[rax], 0

myLoop:
    ;add ebx, dword[rax]
    add ebx, 2          ; Add 2 to register ebx
    add rax, 4          ; Move to next element
    mov dword[rax], ebx
    loop myLoop         ; Decrement rcx and loop until rcx = 0

exit:
    mov rax, SYS_exit       ; Call code for exit
    mov rdi, EXIT_SUCCESS   ; Exit with success status
    syscall