; check a character is vowel or consonant using macro 

;check vowel macro
checkVowel macro al
 
  cmp al,'A'
     je vwl

     cmp al,'a'
     je vwl 

     cmp al,'E'
     je vwl

     cmp al,'e'
     je vwl 

     cmp al,'I'
     je vwl

     cmp al,'i'
     je vwl  

     cmp al,'O'
     je vwl

     cmp al,'o'
     je vwl 

     cmp al,'U'
     je vwl

     cmp al,'u'
     je vwl 
     
     print 'Consonant'
     ret

     vwl:
     print 'Vowel'
     ret
 

endm

include 'emu8086.inc'
org 100h
.model small
.stack 100h

.data
  newline db 0dh, 0ah, "$"

.code

main proc

     mov ax,@data
     mov ds,ax

     print 'Enter a character: '
     mov ah,1h
     int 21h
     mov bl, al
     
     ; print a newline
     call printNewline
     checkVowel bl

main endp 


;newline procedure
printNewline proc
     mov ah, 9
     lea dx, newline
     int 21h
     ret
printNewline endp

end main