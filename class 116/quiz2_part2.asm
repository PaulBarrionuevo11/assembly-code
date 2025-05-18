; Quiz #2 Part 2
; Paul Barrionuevo

; Function that detects IF number (edi) is even 
; IF edi is even, return 1
; IF edi is not even, return 0
; Check by confirming if the last bit is zero

global even_function
section .text
even_function:

    mov rax, 0      ; Setting register rax to zero
    and edi, 1      ; Checking if the last bit is 1 or zero
    jz .even        ; Jump zero instrunction
    je .odd         ; Jump equal instrunction

.odd
ret                 ; Return current rax value

.even:
cmp edi, 0          ; Compares if edi is zero
mov rax, 1          ; Moves one to the register rax
ret                 



