; Classwork 6 - Assembly Lenguage
; eax will be store in result register
; edi will be the first arg on function

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