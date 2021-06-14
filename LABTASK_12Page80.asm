  ;MOSTAFA,BORNIL

  ;ID no ; 17-35574-3
  
  ;CHAPTER_4 EX 12 Page 80
  
  
  
  .MODEL SMALL 
  .STACK 100H
.DATA

STARS DB '***********',10,13,'$' 
STARS2 DB '****$'
STARS3 DB '****',10,13,'$'

MSG  DB  'ENTER THREE INTIALS:$'
 
  
.CODE

MAIN PROC
    
    
    MOV AX,@DATA
    MOV DS,AX
    
   MOV AH,2      
   MOV DL,'?'    ;FOR ? MARK PRITING
   INT 21H 
   
   LEA DX,MSG
   MOV AH,9     ;ENTERING THREE VALUE
   INT 21h
   
   MOV AH,1
   INT 21H       
   MOV BL,AL     ;USING RESISTORS FOR 3 VALUE
   
   
   MOV AH,1
   INT 21H
   MOV BH,AL
   
   MOV AH,1
   INT 21H
   MOV CL,AL
   
         
       MOV AH,2
       MOV DL,10
       INT 21h       ;NEW LINE PRITING 
       
       MOV AH,2
       MOV DL,13
       INT 21H
   
   
   LEA DX,STARS
      MOV AH,9
   INT 21h
   
   INT 21h
   INT 21h          ;for 5*5 STARS
   INT 21h
   INT 21h
   
   LEA DX,STARS2
   MOV AH,9
   INT 21H
   
   
   
                   ;FOR 4 STARS 
     
   MOV AH,2
     MOV DL,BL
   INT 21H
  
   
   
   MOV AH,2
   MOV DL,BH  
   INT 21H
                 ;MOVINGV VALUES FOR OUTPUT
   
   MOV AH,2
   MOV DL,CL
   INT 21H
  
   LEA DX,STARS3
   MOV AH,9
   INT 21H
    
    
      LEA DX,STARS
   MOV AH,9
   INT 21h
    
    
     
   INT 21h
   INT 21h
   INT 21h
   INT 21h
   
   MOV AH,2     ;FOR  BEEP SOUND 
   MOV DL,7
   INT 21H  
   
   
      MOV AH,4CH
     INT 21H
     
  MAIN   ENDP

END MAIN  
   
   
   
   
   
   
   
   
   
   