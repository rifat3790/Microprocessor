;using marco odd even summation in an array

;print odd and even number summation
oddEven macro arr, si
    
;point array usnig source index register
     mov dl, 2
     
      ;traverse & calculate odd,even sum 
     arr_traverse:
     mov ah, 0
     mov al, [si] 
     ;temporary store current element
     mov temp, al
     ;after divide by 2 ah=remainder al=quotien
     div dl 
     cmp ah, 0
     JE even_sum
     JNE odd_sum
     back:
     inc i
     inc si
     cmp i, bl
     JL arr_traverse 
     JE print_result
     
     ;even number calculation
     even_sum:
     mov al, temp
     add al, evenSum
     sub al, 48
     mov evenSum, al
     jmp back
     
     ;odd number calculation
     odd_sum:
     mov al, temp
     add al, oddSum
     sub al, 48
     mov oddSum, al
     jmp back
     
    ;print the result
    print_result:
    print 'Even summation is: '
    mov dl, evenSum
    add dl, 48
    call printNumber     
           
    call printNewline      
    print 'Odd summation is: '
    mov dl, oddSum
    add dl, 48
    call printNumber     
    
endm

;emu8086 library 
include 'emu8086.inc'
.stack 100h
.model small

.data
    arr db 10 dup(?)
    i db 0
    temp db 0
    oddSum db ?
    evenSum db ?
    newline db 10, 13, '$'
    
.code 
    main proc
     ;import data segment
     mov ax, @data
     mov ds, ax
     
     mov si, offset arr
     print 'Enter size of the array: '
     call scan 
     ;store input size into bl register
     mov bl, al 
     sub bl, 48
     
     mov cx, 0
     mov cl, bl ;cx=user input size
     
     call printNewline
     print 'Enter array element: '
     take_input:
     call scan
     mov [si], al
     inc si
     ;pirnt a space between each input
     mov dl, 32
     call printNumber
 
     loop take_input
     
     call printNewline
     mov si, offset arr
     ;call macro with arr and memory address
     oddEven arr, si
     ret
    main endp
    
    
;custom procedure
printNewline proc
    mov ah, 9
    lea dx, newline
    int 21h    
RET
printNewline endp

;printNumber 
printNumber proc
    mov ah, 2
    int 21h    
RET
printNumber endp

;scan number
scan proc
    mov ah, 1
    int 21h
RET
scan endp
 end main       


