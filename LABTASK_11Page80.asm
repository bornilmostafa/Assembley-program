  ;MOSTAFA,BORNIL

  ;ID no ; 17-35574-3
  
  ;CHAPTER_4 EX 11 Page 80




.MODEL SMALL
.STACK 100H
.DATA
 STARS DB '**********',10,13,'$'

.CODE
 MAIN PROC
    
    
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,STARS   
    INT 21H 
    
    
    
    
         
     INT 21H
     
     INT 21H
     
     INT 21H
    
     INT 21H
     INT 21H
     INT 21H
    
     INT 21H
    
     INT 21H
    
     INT 21H
   
   
   
     MOV AH,4CH
     INT 21H
     
  MAIN   ENDP

END MAIN    