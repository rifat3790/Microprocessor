.model small
.stack 100h
.data
    msg_even db 'The number is even.$'
    msg_odd  db 'The number is odd.$'
    newline  db 0Dh,0Ah,'$'
.code
main proc
                 mov ax, @data
                 mov ds, ax

                 mov ah, 1           ; Take a single digit input from user
                 int 21h
                 sub al, '0'         ; Convert ASCII to actual number

                 mov ah, 0           ; Clear upper half of AX (AL contains input)
                 mov bl, 2           ; Divisor (2)
                 div bl              ; Divide AX by BL, remainder goes into AH

                 cmp ah, 0           ; Check if remainder is 0
                 je  print_even      ; If zero, jump to print_even
                 jmp print_odd       ; Else, jump to print_odd

    print_even:  
                 mov ah, 9           ; Display even message
                 lea dx, msg_even
                 int 21h
                 jmp newline_proc

    print_odd:   
                 mov ah, 9           ; Display odd message
                 lea dx, msg_odd
                 int 21h
                 jmp newline_proc

    newline_proc:
                 mov ah, 9           ; Print newline
                 lea dx, newline
                 int 21h
                 
    exit:        
                 mov ah, 4Ch         ; Exit program
                 int 21h
main endp
end main
