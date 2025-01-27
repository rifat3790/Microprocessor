.model small
.stack 100h

.data
    userInput db 3, 0
    inputMsg db 'Enter a doubledigit number: $'
    outputMsg db 13, 10, 'You entered: $'  
    newline db 0dh,0ah,"$",

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display a message to prompt the user for input
    mov ah, 09h
    lea dx, inputMsg
    int 21h

    ; Read a string of maximum 2 characters from the user
    mov ah, 0Ah
    lea dx, userInput
    int 21h

    ; Display a new line
    mov ah, 9
    lea dx, newline

    ; Display the user's input
    mov ah, 09h
    lea dx, outputMsg
    int 21h

    ; Display the user's input from the buffer
    mov dx, offset userInput + 2
    mov ah, 02h
    int 21h
    mov dl, [offset userInput + 1]
    int 21h

    ; Terminate the program
    mov ah, 4ch
    int 21h
main endp

end main
