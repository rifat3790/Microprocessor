.MODEL SMALL
.STACK 100H
.DATA
    C    DB 5 DUP(?)
    SUM  DB ?
    MIN  DB ?
    MAX  DB ?
    AVG  DB ?
    STR  DW "Enter your number: $"
    STR1 DW 'AVERAGE IS: $'
    STR2 DW 'MAX IS: $'
    STR3 DW "MIN IS: $"
.CODE
MAIN PROC
                      MOV  AX, @DATA
                      MOV  DS, AX
                      CALL DISPLAY_MSG
                      CALL INPUT_NUMBERS
                      CALL CALCULATE_SUM
                      CALL FIND_MIN
                      CALL FIND_MAX
                      CALL CALCULATE_AVERAGE
                      CALL DISPLAY_RESULTS
MAIN ENDP

DISPLAY_MSG PROC
                      MOV  DX, OFFSET STR
                      MOV  AH, 9h
                      INT  21H
                      CALL NEWLINE
                      RET
DISPLAY_MSG ENDP

INPUT_NUMBERS PROC
                      MOV  CX, 5
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

CALCULATE_SUM PROC
                      MOV  SI, 0
                      MOV  AL, 0
                      MOV  CX, 5
    SUM_LOOP:         
                      ADD  AL, C[SI]
                      INC  SI
                      LOOP SUM_LOOP
                      MOV  SUM, AL
                      RET
CALCULATE_SUM ENDP

FIND_MIN PROC
                      MOV  SI, 0
                      MOV  AL, C[SI]
                      MOV  MIN, AL
                      INC  SI
                      MOV  CX, 4
    MIN_LOOP:         
                      MOV  AL, C[SI]
                      CMP  AL, MIN
                      JAE  SKIP_MIN
                      MOV  MIN, AL
    SKIP_MIN:         
                      INC  SI
                      LOOP MIN_LOOP
                      RET
FIND_MIN ENDP

FIND_MAX PROC
                      MOV  SI, 0
                      MOV  AL, C[SI]
                      MOV  MAX, AL
                      INC  SI
                      MOV  CX, 4
    MAX_LOOP:         
                      MOV  AL, C[SI]
                      CMP  AL, MAX
                      JBE  SKIP_MAX
                      MOV  MAX, AL
    SKIP_MAX:         
                      INC  SI
                      LOOP MAX_LOOP
                      RET
FIND_MAX ENDP

CALCULATE_AVERAGE PROC
                      MOV  AL, SUM
                      MOV  BL, 5
                      MOV  AH, 0
                      DIV  BL
                      MOV  AVG, AL
                      RET
CALCULATE_AVERAGE ENDP

DISPLAY_RESULTS PROC
                      MOV  DX, OFFSET STR1
                      MOV  AH, 9h
                      INT  21H
                      MOV  AL, AVG
                      ADD  AL, 30H
                      MOV  DL, AL
                      MOV  AH, 2
                      INT  21H
                      CALL NEWLINE

                      MOV  DX, OFFSET STR2
                      MOV  AH, 9h
                      INT  21H
                      MOV  AL, MAX
                      ADD  AL, 30H
                      MOV  DL, AL
                      MOV  AH, 2
                      INT  21H
                      CALL NEWLINE

                      MOV  DX, OFFSET STR3
                      MOV  AH, 9h
                      INT  21H
                      MOV  AL, MIN
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
