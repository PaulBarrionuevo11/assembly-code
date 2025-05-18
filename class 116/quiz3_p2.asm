; QUIZ #3 - Assembly Language
; Author: Paul Barrionuevo (corrected version)
; Function to generate Fibonacci numbers
; C/C++ function: void fib(int n, int *arr);
; Parameters:
;   rdi: n (number of Fibonacci numbers to generate)
;   rsi: arr (pointer to int array to store results)

section .text
global fib
fib:

    push rbx
    push r12

    ; Initialize variables
    mov rbx, rsi        ; rbx = arr (array pointer)
    mov rcx, rdi        ; rcx = n (loop counter)
    mov r12, 0          ; r12 = index (and fib(n-2))
    mov rax, 1          ; rax = fib(n-1)

    ; Store first Fibonacci number (normally 0)
    mov dword [rbx], 0
    dec rcx

    ; Store second Fibonacci number (normally 1)
    mov dword [rbx + 4], 1
    dec rcx

.myLoop:
    ; Calculate next Fibonacci number
    mov r10, rax        
    add r10, r12        
    mov r12, rax       
    mov rax, r10       

    ; Store result in array
    mov r11, rcx
    dec r11
    mov dword [rbx + r11*4 + 8], r10d  ;

    ; Continue loop
    loop .myLoop

.done:
    pop r12
    pop rbx
    ret


