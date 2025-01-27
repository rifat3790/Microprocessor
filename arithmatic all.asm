include 'emu8086.inc'
org 100h
.model small
.stack 100h

.data
    a db ?       ; First number
    b db ?       ; Second number
    result db ?  ; Result of the operation
    remainder db ?  ; Remainder for division
    newline dw 10, 13, "$"  ; Newline

.code
main proc
    mov ax, @data
    mov ds, ax  ; Initialize data segment

    ; Take 1st input
    print "Enter first number: "
    mov ah, 1    ; Function to read a character
    int 21h
    sub al, 48   ; Convert ASCII to integer
    mov a, al

    ; Print newline
    mov ah, 09
    lea dx, newline
    int 21h

    ; Take 2nd input
    print "Enter second number: "
    mov ah, 1    ; Function to read a character
    int 21h
    sub al, 48   ; Convert ASCII to integer
    mov b, al

    ; Print newline
    mov ah, 09
    lea dx, newline
    int 21h

    ; =======================
    ; Addition
    ; =======================
    mov al, a
    add al, b    ; a = a + b
    mov result, al  ; Store result

    ; Print the result
    print "Addition Result: "
    mov ah, 2
    mov dl, result
    add dl, 48   ; Convert integer to ASCII
    int 21h

    ; Print newline
    mov ah, 09
    lea dx, newline
    int 21h

    ; =======================
    ; Subtraction
    ; =======================
    mov al, a
    sub al, b    ; a = a - b
    mov result, al  ; Store result

    ; Print the result
    print "Subtraction Result: "
    mov ah, 2
    mov dl, result
    add dl, 48   ; Convert integer to ASCII
    int 21h

    ; Print newline
    mov ah, 09
    lea dx, newline
    int 21h

    ; =======================
    ; Multiplication
    ; =======================
    mov al, a
    mul b    ; a = a * b
    mov result, al  ; Store result

    ; Print the result
    print "Multiplication Result: "
    mov ah, 2
    mov dl, result
    add dl, 48   ; Convert integer to ASCII
    int 21h

    ; Print newline
    mov ah, 09
    lea dx, newline
    int 21h

    ; =======================
    ; Division
    ; =======================
    mov al, a
    mov ah, 0    ; Clear AH
    div b        ; AL = quotient, AH = remainder
    mov result, al  ; Store quotient
    mov remainder, ah  ; Store remainder

    ; Print the quotient
    print "Division Quotient: "
    mov ah, 2
    mov dl, result
    add dl, 48   ; Convert integer to ASCII
    int 21h

    ; Print newline
    mov ah, 09
    lea dx, newline
    int 21h

    ; Print the remainder
    print "Division Remainder: "
    mov ah, 2
    mov dl, remainder
    add dl, 48   ; Convert integer to ASCII
    int 21h

    ; Print newline
    mov ah, 09
    lea dx, newline
    int 21h

    main endp
end main
