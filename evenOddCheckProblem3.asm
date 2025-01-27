;conditional loop
org 100h
.model small
.stack 100h 
.data
    msg1 db 10, 13,'Enter a number: $'
    msg2 db 10, 13, 'Even $'
    msg3 db 10, 13, 'Odd $'

.code 
    main proc
         mov ax, @data
         mov ds, ax
         
         again:
         mov ah, 9
         lea dx, msg1
         int 21h
         
         mov ah, 1
         int 21h   ;take a number from user
         ;store user input into bl to check user input is N or not
         mov bl, al 
         
         mov ah, 0
         mov dl, 2
         div dl
         
         ;when input is N then exit the program
         cmp bl, 'N'
         JE exit
         
         ;if ah equal 0 goto even level
         cmp ah, 0
         JE even
         ;else if not equal, goto odd level
         JNE odd  
         
         even:
         mov ah, 9
         lea dx, msg2
         int 21h
         jmp again
         
         odd:
         mov ah, 9
         lea dx, msg3
         int 21h
         jmp again
         
         exit:
         mov ah, 4ch
         int 21h 
         
        main endp
    end main