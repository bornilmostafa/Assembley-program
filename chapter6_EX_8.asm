;Chapter6  EX-8  Name:MOSTAFA BORNIL ID:17-35574-3


.MODEL SMALL
.STACK 100H
.DATA 
MSG DB  10,13,'$'
MSG1 DB 10,13,'ENTER Two CAPITAL LETTER=$'


.CODE

MAIN PROC
      
 MOV AX,@DATA
 MOV DS,AX
 
 MOV AH,2
 MOV DL,'?'  ;priting the value of ?
 INT 21H
 
 LEA DX,MSG
 MOV AH,9
 INT 21H 
  
 LEA DX,MSG1
 MOV AH,9
 INT 21H
 
 MOV AH,1  
 INT 21H
  MOV BL,AL           
            ;two input value  
           
 
 MOV AH,1
 INT 21H
 MOV BH,AL
 
 CMP BL,BH
 JGE PRINTB
 JLE PRINTA
 JMP EXit
 
 PRINTB:
   
   
 MOV AH,2
 MOV DL,BH  
 INT 21H           
            ;two input value  
           
 
 MOV AH,2
 MOV DL,BL
 INT 21H
 JMP Exit
 
 
 
 
 
 PRINTA: 
    
 MOV AH,2
 MOV DL,BL 
 INT 21H           
            ;two input value  
           
 
 MOV AH,2
 MOV DL,BH
 INT 21H 
  
 
 Exit:
      MOV AH,4CH
      INT 21H 
      
;  MAIN ENDP
;  END MAIN    