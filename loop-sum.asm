.MODEL SMALL
.STACK 100H
.DATA
    N DB 9
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    XOR BX, BX
    MOV AL, N     ; Move byte-sized N into AL (lower part of AX)
    XOR AH, AH    ; Clear AH to ensure AX has the correct 16-bit value
    MOV CX, AX    ; Move the value of AX into CX
START: 
    ADD BX, CX
    LOOP START
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
