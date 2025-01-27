INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.DATA
    N DW ?          ; Number of terms
    FIB DW 50 DUP(?) ; Array to store Fibonacci series

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    PRINT 'ENTER NUMBER OF TERMS: '
    CALL SCAN_NUM
    MOV N, CX
    PRINTN ''

    ; Initialize first two terms
    MOV FIB, 0
    MOV FIB+2, 1

    ; Generate Fibonacci series
    MOV CX, N
    SUB CX, 2
    MOV SI, 4
FIB_LOOP:
    MOV AX, FIB[SI-4]
    ADD AX, FIB[SI-2]
    MOV FIB[SI], AX
    ADD SI, 2
    LOOP FIB_LOOP

    ; Print Fibonacci series
    PRINT 'FIBONACCI SERIES: '
    MOV CX, N
    MOV SI, 0
PRINT_LOOP:
    MOV AX, FIB[SI]
    CALL PRINT_NUM
    PRINT ' '
    ADD SI, 2
    LOOP PRINT_LOOP

    PRINTN ''
    
RETURN:
    MOV AH, 4CH
    INT 21H
MAIN ENDP

DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_SCAN_NUM

END MAIN