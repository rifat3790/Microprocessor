include 'emu8086.inc'

.model small
.stack 100h

.data
    a db ?
    b db ?
    result db ?
    remainder db ?
    newline dw 10, 13, "$"

.code
main proc
    mov ax, @data
    mov ds, ax

    print "Enter first number: "
    mov ah, 1
    int 21h
    sub al, 48
    mov a, al

    mov ah, 09
    lea dx, newline
    int 21h

    print "Enter second number: "
    mov ah, 1
    int 21h
    sub al, 48
    mov b, al

    mov ah, 09
    lea dx, newline
    int 21h

    mov al, a
    add al, b
    mov result, al

    print "Addition Result: "
    mov ah, 2
    mov dl, result
    add dl, 48
    int 21h

    mov ah, 09
    lea dx, newline
    int 21h

    mov al, a
    sub al, b
    mov result, al

    print "Subtraction Result: "
    mov ah, 2
    mov dl, result
    add dl, 48
    int 21h

    mov ah, 09
    lea dx, newline
    int 21h

    mov al, a
    mul b
    mov result, al

    print "Multiplication Result: "
    mov ah, 2
    mov dl, result
    add dl, 48
    int 21h

    mov ah, 09
    lea dx, newline
    int 21h

    mov al, a
    mov ah, 0
    div b
    mov result, al
    mov remainder, ah

    print "Division Quotient: "
    mov ah, 2
    mov dl, result
    add dl, 48
    int 21h

    mov ah, 09
    lea dx, newline
    int 21h

    print "Division Remainder: "
    mov ah, 2
    mov dl, remainder
    add dl, 48
    int 21h

    mov ah, 09
    lea dx, newline
    int 21h

main endp
end main
