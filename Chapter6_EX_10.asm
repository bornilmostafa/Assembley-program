;CHAPTER_6 Ex:10 ;name:Mostafa,Bornil 
;id : 17-35574-3


.MODEL SMALL
.STACK 100H
.DATA
msg1 db 10,13,'ENTER A HEX DIGIT:$'
msg2 db 10,13,'IN DECIMAL IS IT:$'
msg3 db 10,13,'DO YOU WANT TO DO IT AGAIN?$'
msg4 db 10,13,'ILLEGAL CHARACTER- ENTER 0-9 OR A-F:$'
.code

MAIN PROC
    
again:

 mov ax,@DATA
 mov ds,ax
 lea dx,msg1
 mov ah,9
 int 21h

 mov ah,1
 int 21h

 mov bl,al


 jmp Done





Done:


 cmp bl,'9'
 ja hex       ;if bl>9 go t hex label
 jb num
 je num





hex:
 cmp bl,'F'
 ja illegal      ;if bl>F illegal


 lea dx,msg2
 mov ah,9
 int 21h

 mov dl,'1'
 mov ah,2
 int 21h

 sub bl,17d ; convert to letter
 mov dl,bl
 mov ah,2
 int 21h

 jmp Check




check:

 lea dx,msg3
 mov ah,9
 int 21h

 mov ah,1
 int 21h

 mov cl,al
 cmp cl,'y'
 je again
 cmp cl,'Y'
 je again
 jmp exit


num:

 cmp bl,'0'
 jb illegal

 lea dx,msg2
 mov ah,9
 int 21h


 mov dl,bl
 mov ah,2
 int 21h

 jmp check




illegal:

 lea dx,msg4
 mov ah,9
 int 21h

 mov ah,1
 int 21h

 mov bl,al

 jmp Done


exit :