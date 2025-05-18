; Function in assembly to be called on C/C++ program
; First argument in function is rdi, sec rsi page 172

global myFunction
section .text
myFunction:
    ret



; Example of pop and push function

; rsp will be stack pointer going down and moving with push (going down the stack) and pop to mov the value to rax 
; and travel the stack by add rsp, 8 (going up) and sub rsp, 8 to add a new value into the stack

; use the cmp for compare


