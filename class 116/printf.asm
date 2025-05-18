section .data
    EXIT_SUCCESS equ 0
    SYS_exit     equ 60
    msg1         db  "The value of var1: %d, var2: %d", 10, 0
    var1         dd  256  ; 32-bit integer
    var2         dd  512  ; 32-bit integer

section .text
    global _start
    extern printf

_start:
    mov rdi, msg1       ; First argument (format string)
    mov esi, [var1]     ; Second argument (var1)
    mov edx, [var2]     ; Third argument (var2)
    xor eax, eax        ; Clear RAX (no floating point arguments)
    call printf         ; Call printf

    mov rax, SYS_exit   ; Exit syscall
    xor rdi, rdi        ; Exit status 0
    syscall
