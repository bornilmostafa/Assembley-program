  ;Excricse10 Chapter7
.model small

.stack 100h
.data
msg1 db 10,13,' type a hex number 0 to FFFF:$'
msg2 db 10,13,'illegal hex digit,try again:$'
msg3 db 10,13,'in binary it is $'
.code


 mov ax,@data
 mov ds,ax
 
  
 jmp input

invalid:
 lea dx, msg2
  mov ah,9     ;the messeage of msg2
 int 21h


input:

 lea dx,msg1
 mov ah,9
 int 21h

 xor bx,bx  ;bx=0
 mov cl,4

 mov ah,1
 int 21h


convert:

 cmp al,0dh  ;al=0?
 je end_input

 cmp al,'0' ;compareing if bleow than 0
 jb invalid

 cmp al,'F'  ;comparing if above than F
 ja invalid

 cmp al,39h   
 ja letter

 and al,0fh
 jmp left

 
letter:

 sub al,55d ;convert charcter  to binary

left:
 shl bx,cl ;shifting in left
 or bl,al   ;or operation 

 mov ah,1
 int 21h
 jmp convert


end_input:
 lea dx,msg3
 mov ah,9
 int 21h

 xor dx,dx  
 mov cx,16  ;loop running 16 times


printbinary:
 shl bx,1          ;catch bx 

 jc one            ;cf=1

 mov dl,30h     ;character A to F print
 jmp display


one:            
 mov dl,31h   ;for pritning 1 

display:

 mov ah,2
 int 21h

loop printbinary  

