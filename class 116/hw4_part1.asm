section .data
EXIT_SUCCESS        equ     0
SYS_exit            equ     60

var1                dd      4   ; Variable one declaration
var2                dd      3   ; Variable two declaration

section .text
global _start
_start:

    ; Clear result register
    xor r8, r8  
    mov ecx, 32         ; Loop over 32 bits

myLoop:
    mov eax, [var1]     ; Load multiplicand
    and eax, 1          ; Check the least significant bit
    jz .skip_addition   ; If zero, skip addition
    mov eax, [var2]     ; Load multiplier
    shl rax, cl         ; Shift based on the loop index
    add r8, rax         ; Add to result

.skip_addition:
    shr dword [var1], 1 ; Shift var1 right to check next bit
    loop myLoop

    ; Store the result in rax for syscall exit
    mov rax, r8

exit:
    mov rax, SYS_exit
    mov rdi, EXIT_SUCCESS
    syscall
