; Author: Paul Barrionuevo
; CS116-Assembly Lenguage -  Homework #5
; Description: FLOATING NUMBERS - Create a function, add an array of floats 
; Return the sum
; Values passed on the C function (float* p, int size)

; -----------------------------------
section .text
global sum_floats

sum_floats:
    mov rcx, rsi          ; size argument value
    xorps xmm0, xmm0      ; initialize sum to 0
    mov rbx, rdi          ; array pointer to rbx
    arrayLoop:
        addss xmm0, [rbx] ; add current float to running sum
        add rbx, 4        ; move to next float
    loop arrayLoop
    
    ret

; Compiling commands from asm to c
; 1) yasm -f elf64 hw5.asm -o hw5.o
; 2) gcc -c hw5.c -o hw5_c.o
; 3) gcc hw5.o hw5_c.o -o hw5
; 4) ./hw5

