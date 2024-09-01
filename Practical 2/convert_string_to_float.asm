; ==========================
; Group member 01: Samvit_Prakash_u23525119
; Group member 02: Diya_Budhia_u22594044
; Group member 03: Alisha_Perumal_u22512285
; ==========================
section .data
    errno db 0                     
    extern strtof                   

section .bss
    endptr resq 1                   

section .text
    global convertStringToFloat

convertStringToFloat:
    mov byte [errno], 0

    ; Prepare for the strtof call
    lea rsi, [endptr]            
    call strtof                     

    cmp byte [errno], 0
    jne .conversion_error           

    mov rax, [endptr]               
    cmp byte [rax], 0               
    jne .conversion_error           

    ret

.conversion_error:
    xorps xmm0, xmm0              
    ret
