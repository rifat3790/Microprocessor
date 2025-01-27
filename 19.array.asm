PRINT MACRO STRING
    MOV DX, OFFSET STRING
    MOV AH, 9
    INT 21H
PRINT ENDM

.MODEL SMALL
.STACK 100H
.DATA
    A    DB 1, 2, 2, 1, 1
    SUM  DB ?
    STR  DW "The result is: $"
.CODE
MAIN PROC
            MOV   AX, @DATA
            MOV   DS, AX

            MOV   CX, 0
            MOV   CL, 5
            MOV   SI, 0
            MOV   AX, 0

    LOOP1:  
            ADD   AL, A[SI]
            INC   SI
            LOOP  LOOP1

            MOV   SUM, AL
            PRINT STR
            CALL  NEWLINE
            
            MOV   DX, 0

            MOV   DL, SUM
            ADD   DL, 30H
            MOV   AH, 2
            INT   21H
            
            MOV   AH, 4CH
            INT   21H

MAIN ENDP

NEWLINE PROC
            MOV   AH, 2
            MOV   DL, 13
            INT   21H
            MOV   DL, 10
            INT   21H
            RET
NEWLINE ENDP
END MAIN