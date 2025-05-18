; Quiz #2 Part1
; Paul Barrionuevo
; Function to compare values in edi and esi
;   -1 if edi < esi
;    0 if edi = esi
;    1 if edi > esi

section .text
global compare_values
compare_values:
    cmp edi, esi        
    
    mov rax, 0          ; Initialize rax value to zero     
    je .equal           
    jg .greater  
    jl .less      
    
.less:
    mov rax, -1         ; edi < esi
    ret
    
.greater:
    mov rax, 1          ; edi > esi
    ret

.equal:
    ret                 ; Return with result in rax