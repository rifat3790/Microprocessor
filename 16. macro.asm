ADDITION MACRO NUM1, NUM2
    MOV AX, NUM1
    MOV BX, NUM2
    ADD AX, BX
ENDM

ORG 100H

.DATA
    A DW 10
    B DW 5

.CODE 
    MAIN PROC 
        ADDITION A, B
        MOV AH, 4CH
        INT 21H
        MAIN ENDP
END MAIN