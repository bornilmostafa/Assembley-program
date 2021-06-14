;Excrise 8 chapter7

.Model Small 

.stack 100h
.data
.code



main proc
    
    mov ax,@data
    mov ds,ax
     xor bh,bh ;bh=0
    ;input
    MOV AH,1
    INT 21H
    MOV BL,AL    
    mov cx,8  
    ;2input in binary and keep a counter for 1
start:
    ROL bl,1
    JC P1
    JMP p0
  P1:
  mov ah,2
  mov dl,'1'
  int 21h  
   inc bh
  jmp next  
    
 P0:     
  mov ah,2
  mov dl,'0' 
  int 21h
  
    
           
  next:
      loop start
  
    mov ah,4ch
    int 21h 