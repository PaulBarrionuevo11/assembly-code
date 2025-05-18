var1        dd      1.234
var2        dd      3.1415

msg         db      "Output: %f", 10, 0
section .text

global _start
_start:

mov rdi, msg
xor rsi, rsi ; rsi = 0
movss xmm0, dword[var1]
movss xmm0, dword[var2]
addss xmm0,xmm1
mov esi, dword[var2]
call xprint


