section .text
global is_palindrome

is_palindrome:

    xor rdx, rdx          
    mov rcx, rsi
    dec rcx               

.check_loop:

    ; Compare characters
    mov al, [rdi + rdx]   ; Char at start
    cmp al, [rdi + rcx]   ; Char at end
    jne .false            ; Mismatch -> not a palindrome

    inc rdx               ; start++
    dec rcx               ; end--
    jmp .check_loop

.true:
    mov rax, 1            ; Return true
    ret

.false:
    mov rax, 0            ; Return false
    ret