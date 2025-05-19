; Classwork 6 - Assembly Lenguage
; Author: Paul Barrionuevo
; Notes: count the number of bits in a number. Int count_bits(int x); 

section .text
global bit_count
bit_count:
    mov ecx, 32     ; Number of times that the loop will run
    xor eax, eax    ; Setting return register to zero

    myloop:
    mov edx, 1      
    SHL edx, cl     ; shift the edx register by the amount in CL
    AND edx, edi
    cmp edx, 0
    je .continue_loop
    add eax, 1

    .continue_loop
        loop myloop
ret
