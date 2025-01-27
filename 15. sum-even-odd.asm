.MODEL SMALL
.STACK 100H
.DATA
    C         DB 10 DUP(?)
    SUM_ODD   DB 0
    SUM_EVEN  DB 0
    STR_INPUT DW "Enter 10 numbers: $"
    STR_ODD   DW "Sum of odd numbers: $"
    STR_EVEN  DW "Sum of even numbers: $"
.CODE
MAIN PROC
                      MOV  AX, @DATA
                      MOV  DS, AX
                      CALL DISPLAY_INPUT_MSG
                      CALL INPUT_NUMBERS
                      CALL SUM_ODD_NUMBERS
                      CALL SUM_EVEN_NUMBERS
                      CALL DISPLAY_RESULTS
MAIN ENDP

DISPLAY_INPUT_MSG PROC
                      MOV  DX, OFFSET STR_INPUT
                      MOV  AH, 9h
                      INT  21H
                      CALL NEWLINE
                      RET
DISPLAY_INPUT_MSG ENDP

INPUT_NUMBERS PROC
                      MOV  CX, 10
                      MOV  SI, 0
    INPUT_LOOP:       
                      MOV  AH, 1
                      INT  21H
                      SUB  AL, 30H
                      MOV  C[SI], AL
                      INC  SI
                      LOOP INPUT_LOOP
                      RET
INPUT_NUMBERS ENDP

SUM_ODD_NUMBERS PROC
                      MOV  SI, 0
                      MOV  AL, 0
                      MOV  CX, 10
    SUM_ODD_LOOP:     
                      MOV  BL, C[SI]
                      AND  BL, 1
                      JZ   SKIP_ODD
                      ADD  AL, C[SI]
    SKIP_ODD:         
                      INC  SI
                      LOOP SUM_ODD_LOOP
                      MOV  SUM_ODD, AL
                      RET
SUM_ODD_NUMBERS ENDP

SUM_EVEN_NUMBERS PROC
                      MOV  SI, 0
                      MOV  AL, 0
                      MOV  CX, 10
    SUM_EVEN_LOOP:    
                      MOV  BL, C[SI]
                      AND  BL, 1
                      JNZ  SKIP_EVEN
                      ADD  AL, C[SI]
    SKIP_EVEN:        
                      INC  SI
                      LOOP SUM_EVEN_LOOP
                      MOV  SUM_EVEN, AL
                      RET
SUM_EVEN_NUMBERS ENDP

DISPLAY_RESULTS PROC
                      MOV  DX, OFFSET STR_ODD
                      MOV  AH, 9h
                      INT  21H
                      MOV  AL, SUM_ODD
                      ADD  AL, 30H
                      MOV  DL, AL
                      MOV  AH, 2
                      INT  21H
                      CALL NEWLINE

                      MOV  DX, OFFSET STR_EVEN
                      MOV  AH, 9h
                      INT  21H
                      MOV  AL, SUM_EVEN
                      ADD  AL, 30H
                      MOV  DL, AL
                      MOV  AH, 2
                      INT  21H
                      CALL NEWLINE
                      RET
DISPLAY_RESULTS ENDP

NEWLINE PROC
                      MOV  AH, 2
                      MOV  DL, 13
                      INT  21H
                      MOV  DL, 10
                      INT  21H
                      RET
NEWLINE ENDP

END MAIN
