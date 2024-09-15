; ==========================
; Group member 01: Name_Surname_student-nr
; Group member 02: Alisha_Perumal_u22512285
; Group member 03: Diya_Budhia_u22594044
; ==========================

; ;=========================================================================================
; ;initialize sum to 0
; ;loop through both matrices, multiply elements
; ;accumulate the products in sum
; ;return the dot product (sum)
; ;=========================================================================================

 segment .text
    global calculateMatrixDotProduct
    
calculateMatrixDotProduct:
    ; Initialize sum to zero (use xmm0 for the sum)
    xorps xmm0, xmm0         ; clear xmm0 (to hold the sum)

    ; Outer loop over rows (rdi = matrix1, rsi = matrix2, rdx = rows, rcx = cols)
    xor r8, r8               ; r8 = row index (start at 0)
.loop_rows:
    cmp r8, rdx              ; check if row index >= rows
    jge .done                ; if all rows are processed, finish

    ; Load row pointers for matrix1 and matrix2
    mov rax, [rdi + r8 * 8]  ; rax = matrix1[row]
    mov rbx, [rsi + r8 * 8]  ; rbx = matrix2[row]

    ; Inner loop over columns
    xor r9, r9               ; r9 = column index (start at 0)
.loop_cols:
    cmp r9, rcx              ; check if column index >= cols
    jge .next_row            ; if all columns are processed, go to the next row
 ; Load matrix1[row][col] and matrix2[row][col] into xmm1 and xmm2
    movss xmm1, [rax + r9 * 4] ; load matrix1[row][col] into xmm1
    movss xmm2, [rbx + r9 * 4] ; load matrix2[row][col] into xmm2

    ; Multiply the elements
    mulss xmm1, xmm2         ; xmm1 = matrix1[row][col] * matrix2[row][col]

    ; Add the result to the sum
    addss xmm0, xmm1         ; xmm0 += matrix1[row][col] * matrix2[row][col]

    ; Move to the next column
    inc r9
    jmp .loop_cols

.next_row:
    ; Move to the next row
    inc r8
    jmp .loop_rows

.done:
    ; Return the sum (dot product) in xmm0
        ret


