; ==========================
; Group member 01: Name_Surname_student-nr
; Group member 02: Alisha_Perumal_u22512285
; Group member 03: Diya_Budhia_u22594044
; ==========================

section .data
    ; Import necessary functions
    extern malloc
    extern free
    extern printf
    extern allocateMatrix

section .text
    global addMatrices

addMatrices:
    ; Function prologue
    push rbp
    mov rbp, rsp
    
    ; Preserve non-volatile registers
    push rbx
    push r12
    push r13
    push r14
    push r15
    
    ; Store parameters
    mov r12, rdi    ; matrix1
    mov r13, rsi    ; matrix2
    mov r14d, edx   ; rows
    mov r15d, ecx   ; cols
    
    ; Allocate memory for result matrix
    mov rdi, r14    ; rows
    mov rsi, r15    ; cols
    call allocateMatrix
    mov rbx, rax    ; Store result matrix pointer in rbx
    
    ; Initialize loop counters
    xor r8d, r8d    ; i = 0
    
outer_loop:
    cmp r8d, r14d
    jge end_outer_loop
    
    xor r9d, r9d    ; j = 0
    
inner_loop:
    cmp r9d, r15d
    jge end_inner_loop
    
    ; Calculate offset: i * cols + j
    mov eax, r8d
    imul eax, r15d
    add eax, r9d
    
    ; Load matrix1[i][j]
    mov rsi, [r12 + r8 * 8]
    movss xmm0, [rsi + r9 * 4]
    
    ; Load matrix2[i][j]
    mov rsi, [r13 + r8 * 8]
    movss xmm1, [rsi + r9 * 4]
    
    ; Add matrix1[i][j] and matrix2[i][j]
    addss xmm0, xmm1
    
    ; Store result in result[i][j]
    mov rsi, [rbx + r8 * 8]
    movss [rsi + r9 * 4], xmm0
    
    inc r9d
    jmp inner_loop
    
end_inner_loop:
    inc r8d
    jmp outer_loop
    
end_outer_loop:
    ; Return result matrix
    mov rax, rbx
    
    ; Function epilogue
    pop r15
    pop r14
    pop r13
    pop r12
    pop rbx
    pop rbp
    ret



