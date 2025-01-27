org 100h
    MOV [3000H], 25H
    MOV [3001H], 15H
    MOV [3002H], 45H
    MOV [3003H], 35H
    MOV [3004H], 55H
 
    mov si, 3000h
    mov dx, 3001h
    mov ch, 04h
    
back1:
    mov cl, ch
    mov di, dx
back:
    mov al, [si]
    mov bl, [di]
    cmp al, bl
    jnc next
    mov [si], bl
    mov [di], al
next:
    inc di
    dec cl
    jnz back
    
    inc si
    inc dx
    dec ch
    jnz back1
    ret