  
  ;ID no ; 17-35574-3
  
  ;CHAPTER_4 EX 9 Page 80
   
   
  .MODEL SMALL 
  .STACK 100H
.DATA

msg1 DB 'ENTER THREE INITIALS : $'
 
.CODE

MAIN PROC
    
   mov  ax,@data
   mov ds,ax
             
             
   lea  dx,msg1
   mov ah,9
   int 21h
   
   
   
   mov ah,1
   int 21h
   mov bl,al
   
   mov ah,1
   int 21h
   mov bh,al
   
   
   mov ah,1
   int 21h
   mov cl,al
   
   
   
   
   
 mov ah,2
 mov dl,10
int 21h
     
 mov ah,2
mov dl,13
int 21h
   
mov ah,2
mov dl,bl
int 21h

     
 mov ah,2
 mov dl,10
int 21h
     
 mov ah,2
mov dl,13
int 21h 
   
   
mov ah,2
mov dl,bh
int 21h     
 
 
  mov ah,2
 mov dl,10
int 21h
     
 mov ah,2
mov dl,13
int 21h       


   
mov ah,2
mov dl,cl
int 21h 