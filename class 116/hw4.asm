; Homework #4 - Assembly Lenguage
; Author: Paul Barrionuevo
; Description: Multiply two numbers by addition in a loop function

section .data
EXIT_SUCCESS    equ     0
SYS_exit        equ     60

var1            dw      10      ; First variable that multiplies
var2            dw      20      ; Second variable that multiplies
result          dw      0       ; Result for multiplication

section .text
global _start
_start:

mov eax, dword [var1]      ; Load var1 into rax (zero-extended to 64 bits)
mov ebx, dword [var2]      ; Load var2 into rbx (zero-extended to 64 bits)
xor ecx, ecx                ; Clear ecx (loop counter)
xor edx, edx                ; Clear edx (accumulator for result)

myLoop:
cmp ecx, ebx                ; Compare counter with var2
jge .done                    ; If counter >= var2, exit loop
add edx, eax                ; Add var1 to result
loop myLoop

.done:
mov [result], edx           ; Store final result

last:
mov rax, SYS_exit
mov rdi, EXIT_SUCCESS
syscall