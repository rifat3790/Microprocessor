;call= transfer the execution of the current program
;ret = return to the execution of the program where we left
 include 'emu8086.inc'
 org 100h
 .model small
 .stack 100h
 .data 
     arr db 5 dup(?)
     i db ? ;iterator to continue loop
     avg db ?
     newline db 10, 13, "$"
 .code 
    main proc
    ;include data segment
    mov ax, @data
    mov ds, ax

     mov si, offset arr ;set pointer to the array
     mov cx, 5 ;since array size is 5
     
     print 'Enter array element: '
     L1:
     call scan ;scan function call
     mov [si], al
     inc si ;increment array index

     mov dl, 32 ;dl 32 for space
     call printf
     loop L1 
 
     ;call find largest,smallest & average procedure
     call newlinePrint 
     call findLargest
     call newlinePrint
     call findSmallest
     call newlinePrint
     call findAverage
    RET  
    ;end main procedure    
    main endp      
    
    
    
;find largest number in an array
findLargest proc
    mov si, offset arr ;set pointer to the array
    mov bl, [si] ;first value store in 'bl' as largest
    mov i, 0 ;iterator for loop instead cx
    
    checkLargest:
    cmp [si], bl
    JGE swapL
    backLargest:
    inc si
    inc i ;increment both si & i 
    cmp i, 5
    JL checkLargest
    JGE printLargest
    
    swapL: ;swap two value
    mov bl, [si]
    jmp backLargest ;back to the loop
    
    ;print largest number
    printLargest:
    print 'Largest Number is: '
    mov dl, bl
    call printf
     
    RET   
findLargest endp   
    
    
;smallest number in an array
findSmallest proc
    mov si, offset arr
    mov bl, [si] 
    mov i, 0 
    
    ;loop start
    checkSmallest:
    cmp [si], bl
    JLE swapS
    backSmallest:
    inc si
    inc i 
    cmp i, 5
    JL checkSmallest
    JGE printSmallest
    ;loop end
    
    swapS: ;swap two value
    mov bl, [si]
    jmp backSmallest ;back to the loop
    
    ;print largest number
    printSmallest:
    print 'Smallest Number is: '
    mov dl, bl
    call printf
     
    RET
findSmallest endp
    

;find average
findAverage proc
    mov si, offset arr
    mov cx,5
    mov al,0
    calculateAVG:
    mov bl, [si]
    sub bl, 48
    add al, bl
    inc si
    loop calculateAVG
    ;ax=al+ah.. al contains vlaue,so heigher bytes set 0
    mov ah,0
    mov dl, 5
    div dl
 
    print 'Average is: '
    add al, 48
    mov dl, al
    call printf 
RET
findAverage endp 

;newline print procedure
newlinePrint proc
    mov ah, 9
    lea dx, newline
    int 21h
    RET    
newlinePrint endp   
      
;scan procedure to take input
scan proc
    mov ah, 1
    int 21h    
    RET    
scan endp
       
;print number        
printf proc
    mov ah, 2
    int 21h
    RET
printf endp
 end main