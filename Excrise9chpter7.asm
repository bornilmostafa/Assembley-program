;Excrise9 chapter 9

.MODEL SMALL
.STACK 100H

.DATA
.CODE
Main proc
    
    ;Input  
    input:
    mov ah,1
    int 21h
    mov bl,al  
    
    
    cmp bl,0dh
    je end
    
  ;output
   mov ah,2
   mov dl,bl
   int 21h
    
   mov cx,4
   convert:
   mov dl,bh
   shr dl,4  ;shift left 4 tiems
   
   
   
   cmp dl,9  ;0<dl<9
   jbe num
   
   add dl,55d    ;normal conversion number
   jmp display
   
  num:
   
     add dl,30h  ;Ato F conversion
     
     display:
     
     
     mov ah,2
     int 21h
     rcl bx,4;rotate 4 times
     
    
     
     loop convert
     
     jmp input
     
     end:
       mov ah,4ch
       int 21h
   
    
    
    
    
    
 