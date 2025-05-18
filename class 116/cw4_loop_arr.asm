section .data
array       dd      10, 20, 30, 40, 50, 60, 70, 80, 90, 100 ; Declaring an array of 10 elements
EXIT_SUCCESS equ    0
SYS_exit  equ      60
;--------------------------------------------------

section .text
global _start
_start:

mov rax, array   ; Load address of array
xor ecx, ecx       ; Initialize sum in ecx
mov rbx, 10      ; Number of elements

myLoop:
    add ecx, dword[rax] ; Add current element to sum
    add rax, 4         ; Move to next element
    dec rbx            ; Decrease counter
    cmp rbx, 0         ; Check if done
    je exit            ; Exit if rbx is 0
    jmp myLoop         ; Repeat loop

exit:
    mov eax, ecx       ; Move sum from ecx to eax for result
    mov rax, SYS_exit  ; Call code for exit
    mov rdi, EXIT_SUCCESS ; Exit with success status
    syscall


