;print a number is odd or even
org 100h
.model small
.stack 100h

.data
    even db 'Enter a number: $'
    result_msg db 'number is: $'
    newline db 0dh,0ah,"$"
.code

    main proc
        mov ax, @data
        mov dx, ax
        
        mov ah, 9
        lea dx, msg_1 ;print message 1
        int 21h
        
        mov ah, 1
        int 21h      ;input a number and store to BL
        mov BL, al
        
        mov ah, 9
        lea dx, newline ;print newline
        int 21h
                 
        mov ah, 9
        lea dx, result_msg 
        int 21h
        
        mov bl, 2
        div bl
        
        
        cmp ah, 0
        JE even_
        
          mov ah, 2
            mov dl, bl
            int 21h
            
            int 21h
            mov dl, bh
            ret
        
        even_: 
;when remainder is 0,means number is even
            mov ah, 9
            lea dx, 
            ret
 
 
 
 main endp
    
 end main