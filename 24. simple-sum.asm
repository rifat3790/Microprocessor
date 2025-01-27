.MODEL SMALL
.STACK 100H
.DATA
    A    DW 5
    B    DW ?
    C    DW ?
    STR  DW "Enter your number: $"
.CODE
MAIN PROC
         MOV AX, @DATA
         MOV DS, AX
   
         MOV DX, OFFSET STR
         MOV AH, 9h
         INT 21H
   
         MOV AH, 1
         INT 21H
         SUB AX, 30H
   
         MOV B, AX
         MOV AX, A
         ADD AX, B
         MOV C, AX
     
         MOV AH, 2
         MOV DL, 13
         INT 21H
         MOV DL, 10
         INT 21H
     
         MOV DX, C
         ADD DX, 48
         MOV AH, 2h
         INT 21H
   
MAIN ENDP
END MAIN