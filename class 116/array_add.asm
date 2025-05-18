section .data
lst     dd     10, 20, 30, 40
result  dd     0
EXIT_SUCCESS equ 0
SYS_exit     equ 60

section .text
global _start
_start:
    mov rcx, 4          ; Number of elements
    mov r12, 0          ; Offset counter (in bytes)
    mov eax, 0          ; Clear accumulator

myLoop:
    add eax, dword[lst+r12] ; Add 32-bit element to eax
    add r12, 4          ; Move to next element (4 bytes)
    loop myLoop         ; Repeat until rcx = 0

    mov dword[result], eax ; Store final sum in result

    ; Exit program
    mov rax, SYS_exit
    mov rdi, EXIT_SUCCESS
    syscall