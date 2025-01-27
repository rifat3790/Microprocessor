
evenOddSum macro arr, si
     mov dl, 2
     
        
     L1:
     mov ah, 0
     mov al, [si] 
      
     mov temp, al
      
     div dl 
     cmp ah, 0
     JE even
     JNE odd
     back:
     inc n
     inc si
     cmp n, bl
     JL L1
     JE result
     
     
     even:
     mov al, temp
     add al, evenSum
     sub al, 48
     mov evenSum, al
     jmp back
     
      
     odd:
     mov al, temp
     add al, oddSum
     sub al, 48
     mov oddSum, al
     jmp back
     
     
    result:
     
    mov dl, evenSum
    add dl, 48
    mov ah, 2
    int 21h    
           
          
    
    mov dl, oddSum
    add dl, 48
    mov ah, 2
    int 21h    
    
endm

 
 
.stack 100h
.model small

.data
    array db 5 dup(?)
    n db 0
    oddSum db ?
    evenSum db ?
    temp db 0
    
.code 
    main proc
 
     mov ax, @data
     mov ds, ax
     
     mov si, offset array
     
     mov ah, 1
     int 21h
     mov bl, al 
     sub bl, 48
     
     mov cx, 0
     mov cl, bl 
     
     
     input:
     mov ah, 1
     int 21h
     mov [si], al
     inc si
     loop input
     
      
     mov si, offset array
      
     evenOddSum array, si
     ret
    main endp

 end main       


