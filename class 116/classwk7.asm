; Description: Create a function to loop over a 3D Matrix
; Author: Paul Barrionuevo
; Notes: C function -> void add_mat(int A[][3], int B[][3], int C[][3], int rows, int cols)


section .text       
global _adding_matrices     ; Create a global function name
_adding_matrices:

    ; Arguments:
    ; rdi = address of matrix A
    ; rsi = address of matrix B
    ; rdx = address of result matrix C
    ; rcx = number of elements (rows * cols)
    ; r8  = 4 byte offset over the stack

    mov rcx, 3
    xor r8, r8

    outerLoop:
        push rcx                ; push outerLoop count from rcx to the stack
        mov rcx, 3              ; initalizes a new counter for the innerLoop

        innerLoop:
        mov ebx, dword[rdi+r8]  ; Starts at the first array location [rcx][rdi+r8]
        add ebx, dword[rsi+r8]  ; Adds [rcx][rdi+r8] with [rcx][rsi+r8]
        mov [rdx+r8], ebx       ; Moves ebx address to location [rcx][rdx+r8]
        add r8, 4               ; Moves to the next array location
        loop innerLoop          ; Loops continues until zero

        pop rcx
    loop outerLoop

    ret                         ; Return value




        
