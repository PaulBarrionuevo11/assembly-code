section .data
    EXIT_SUCCESS    equ     0       ; Successful operation
    SYS_exit        equ     60      ; Call code for terminate

    bVar1           db      20
    bResult         db      0

    wVar1           dw      2000
    wResult         dw      0

    dVar1           dd      1500 ; Try with 0x000000FF
    dResult         dd      0

    qVar1           dq      0x00000000000000FF ; Try with a signed value
    qResult         dq      0

section .text
global _start

_start:

    ; Clearing register
    xor rax, rax
    
    ; Byte example: bResult = bVar1 / 2
    mov al, byte [bVar1]   ; Load bVar1 into AL
    mov bl, 2              ; Set divisor to 2
    div bl                
    mov byte [bResult], al ; Store the quotient in bResult

    ;-------------------------------------------------------------
    ; Word example: wResult = wVar1 * 2
    mov ax, word [wVar1]  
    mov bx, 2             
    mul bx               
    mov word [wResult], ax ; Store lower 16 bits of result
    ; If wResult should be 32-bit, change it to a dd variable

    ; -----------------------------------------
    ; Double-word example: dResult = dVar1 / 3
    xor edx, edx            ; Clear EDX to avoid sign extension issues
    mov eax, dword [dVar1]  ; Load dVar1 into EAX
    mov ebx, 3              ; Set divisor
    div ebx                
    mov dword [dResult], eax ; Store quotient in dResult

    ; -------------------------------------------------
    ; Quadword example: qResult = qVar1 * 2
    mov rax, qword [qVar1]  ; Load qVar1
    mov rbx, 2
    mul rbx                
    mov qword [qResult], rax ; Store the lower 64-bit result

    ; Exit program
    mov rax, SYS_exit       ; Call code for exit
    mov rdi, EXIT_SUCCESS   ; Exit with success status
    syscall

