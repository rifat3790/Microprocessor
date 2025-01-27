.model small
.stack 100h
.data
    msg db 'Enter a number: $'         ; Message to prompt user
    input db 2 dup(?)                  ; Buffer to hold user input
    sum dw 0                           ; Variable to store summation result
    counter dw 1                       ; Counter initialized to 1
    newline db 0Dh, 0Ah, '$'           ; Newline string

.code
main proc
    mov ax, @data
    mov ds, ax                         ; Initialize data segment

    ; Display message to prompt the user for input
    mov ah, 9
    lea dx, msg
    int 21h

    ; Get user input (up to 5 digits)
    mov ah, 0Ah                        ; DOS interrupt to take string input
    lea dx, input
    int 21h

    ; Convert input string to number (stored in AX)
    call string_to_number              ; Convert user input to an integer in AX
    mov cx, ax                         ; Move AX (the input number) to CX (loop counter)

    ; Initialize sum to 0
    mov sum, 0                         ; Reset sum to 0

    ; Start loop to calculate the sum of squares
start_loop:
    mov ax, counter                    ; Move counter into AX
    mul ax                             ; Square AX (AX = AX * AX)
    add sum, ax                        ; Add square of counter to sum
    inc counter                        ; Increment counter by 1
    loop start_loop                    ; Decrement CX and repeat until CX = 0

    ; Print the final result
    mov ax, sum                        ; Move sum into AX for printing
    call print_number                  ; Print the result stored in AX

    ; Print newline
    mov ah, 9
    lea dx, newline
    int 21h

    ; Exit the program
    mov ah, 4Ch
    int 21h
main endp

; Subroutine to convert string to number
string_to_number proc
    xor ax, ax                         ; Clear AX
    lea si, input+1                    ; Load pointer to input string (skipping input length byte)
    mov cl, [input]                    ; CL gets the number of characters entered by the user
    xor bx, bx                         ; Clear BX (will store the final number)

convert_loop:
    mov al, [si]                       ; Get character from input
    sub al, '0'                        ; Convert ASCII to integer
    mov ah, 0
    mov dx, 10                         ; Multiply current result by 10
    mul dx                             ; Multiply AX by 10 (this is our base conversion)
    add bx, ax                         ; Add current digit to BX (BX stores the final number)
    inc si                             ; Move to next character in the input string
    dec cl                             ; Decrement character count
    jnz convert_loop                   ; Repeat until all characters are processed

    mov ax, bx                         ; Move the result (BX) to AX
    ret
string_to_number endp

; Subroutine to print a number stored in AX
print_number proc
    push ax                            ; Save AX
    push bx
    push cx
    push dx

    xor cx, cx                         ; Clear CX (to count digits)
    
    ; Check if AX is zero, handle it separately
    cmp ax, 0
    jne print_loop

    ; If AX is 0, print zero directly
    mov dl, '0'
    mov ah, 2
    int 21h
    jmp print_done

print_loop:
    xor dx, dx                         ; Clear DX (for division)
    mov bx, 10                         ; Divisor for extracting digits
    div bx                             ; Divide AX by 10, remainder in DX (digit), quotient in AX
    push dx                            ; Save remainder (digit)
    inc cx                             ; Increment digit count
    cmp ax, 0
    jne print_loop                     ; Repeat until AX becomes 0

print_digits:
    pop dx                             ; Retrieve digit from stack
    add dl, '0'                        ; Convert to ASCII
    mov ah, 2                          ; DOS interrupt to print character
    int 21h
    loop print_digits                  ; Print all digits

print_done:
    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_number endp
end main
