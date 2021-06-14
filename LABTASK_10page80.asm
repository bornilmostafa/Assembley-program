  ;MOSTAFA,BORNIL  
  ;ID no ; 17-35574-3
  
  ;CHAPTER_4 EX 10 Page 80



.MODEL SMALL
.STACK 100H
.DATA

MSG DB 'ENTER A HEX DIGIT: $'
MSG2 DB 'IN DECIMAL IT IS 1$' 


.CODE
 MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    
    SUB BL,17
    
       MOV AH,2
       MOV DL,10
       INT 21h
       
       MOV AH,2
       MOV DL,13
       INT 21H
    
    
    MOV AH,9
    LEA DX,MSG2
    INT 21H
        
        
        
    
    MOV AH,2
    MOV DL,BL
    INT 21H  
    
        
     MOV AH,4CH
     INT 21H
     
  MAIN   ENDP

END MAIN

    
    