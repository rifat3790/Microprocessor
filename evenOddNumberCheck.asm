;check a number is odd or even
org 100h
.model small
.stack 100h

.data
    msg db 'Enter a number: $'
    even db 'Even$'
    odd db 'Odd$'
    result_msg db 'Number is: $'
    newline db 0dh, 0ah, "$"

.code

main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, msg ; print a message
    int 21h

    mov ah, 1
    int 21h   ; get input from user
    mov bl, al  ; move the value to bh

    mov ah, 9
    lea dx, newline ; print newline
    int 21h

    mov ah, 9
    lea dx, result_msg ;print a message
    int 21h

    ;now i will do logical and operation with 1.
    ;after that if LSB of number is 1.then and with 1 will give us 
    ;always 1. means number was odd. because
    ;all the odd number start with 1 LSB
    mov al, bl ;bl value to al 
    and al, 1  ;if bit of al is 1.means even odd number
    
    cmp al, 1
    JE odd_ ;jump to odd label if eqal LSB 1.
    
     mov ah, 9
        lea dx, even
        int 21h
        ret
     
    odd_:
        mov ah, 9
        lea dx, odd
        int 21h
        ret
   
 

main endp

end main
