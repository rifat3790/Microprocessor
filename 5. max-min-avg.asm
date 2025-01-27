INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.DATA
    A DW 50 DUP(?)  ; Array to store elements
    LENG DW ?       ; Length of the array
    MAX DW ?        ; Maximum value
    MIN DW ?        ; Minimum value
    SUM DW ?        ; Sum of elements
    AVG DW ?        ; Average value

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    PRINT 'ENTER ARRAY LENGTH: '
    CALL SCAN_NUM
    MOV LENG, CX
    PRINTN ''

    PRINT 'INPUT ARRAY ELEMENTS:'
    MOV SI, 0
    MOV CX, LENG
INPUT_LOOP:
    PRINTN ''
    PUSH CX
    CALL SCAN_NUM
    MOV A[SI], CX
    POP CX
    INC SI
    INC SI
    LOOP INPUT_LOOP

    ; Initialize MAX and MIN with the first element
    MOV AX, A
    MOV MAX, AX
    MOV MIN, AX
    MOV SUM, 0

    ; Find MAX, MIN, and SUM
    MOV SI, 0
    MOV CX, LENG
FIND_LOOP:
    MOV AX, A[SI]
    ADD SUM, AX

    ; Check for MAX
    CMP AX, MAX
    JLE CHECK_MIN
    MOV MAX, AX

CHECK_MIN:
    ; Check for MIN
    CMP AX, MIN
    JGE CONTINUE
    MOV MIN, AX

CONTINUE:
    INC SI
    INC SI
    LOOP FIND_LOOP

    ; Calculate AVERAGE
    MOV AX, SUM
    MOV BX, LENG
    DIV BX
    MOV AVG, AX

    ; Print MAX
    PRINTN ''
    PRINT 'MAXIMUM VALUE: '
    MOV AX, MAX
    CALL PRINT_NUM

    ; Print MIN
    PRINTN ''
    PRINT 'MINIMUM VALUE: '
    MOV AX, MIN
    CALL PRINT_NUM

    ; Print AVERAGE
    PRINTN ''
    PRINT 'AVERAGE VALUE: '
    MOV AX, AVG
    CALL PRINT_NUM

RETURN:
    MOV AH, 4CH
    INT 21H
MAIN ENDP

DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_SCAN_NUM

END MAIN