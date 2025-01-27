PRINT MACRO STRING
    MOV DX, OFFSET STRING
    MOV AH, 9
    INT 21H
PRINT ENDM

.MODEL SMALL
.STACK 100H
.DATA
    A    DB 5 DUP(?)
    STR  DW "The numbers in reverse order are: $"
    STR1 DW "ENTER YOUR NUMBER: $"
.CODE
MAIN PROC
                  MOV   AX, @DATA
                  MOV   DS, AX

                  PRINT STR1
                  CALL  NEWLINE

            
                  MOV   CX, 5
                  MOV   SI, 0

    INPUT:        
                  MOV   AH, 1
                  INT   21H
                  SUB   AL, 30H
                  MOV   A[SI], AL
                  INC   SI
                  LOOP  INPUT

                  CALL  NEWLINE

                  PRINT STR
                  CALL  NEWLINE

            
                  MOV   CX, 5
                  MOV   SI, 4

    REVERSE_PRINT:
                  MOV   DL, A[SI]
                  ADD   DL, 30H
                  MOV   AH, 2
                  INT   21H
                  DEC   SI
                  LOOP  REVERSE_PRINT

                  CALL  NEWLINE

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
