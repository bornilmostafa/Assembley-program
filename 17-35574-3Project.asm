.Model small
.Stack 100h
.Data

Message1  DB   '------------Small Calculator---------$'
Message2  DB   'Choose Your operator :$'
Message3  DB   'Enter your first number:$'
Message4  DB   'Enter your second number:$' 
Message5  DB   'So its addition$'
Message10 DB   'So its subtraction$'  
Message11 DB   'So its Multipilcation$'
Message12 DB   'So it is division$'
Message13 DB   'Quotient:$'
Message14 DB   'Reminder:$' 
Newline   DB   10,13,'$'
Number1   DB    0
Number2   DB    0
Operator  DB    0
Message6  DB   '!!!!!!!THANK YOU !!!!!$'
Message7  DB   'DO WANT TO CALCULATE MORE?? PRESS 1$'
Message8  DB   'DO YOU WANT TO EXIT?? PRESS 2$' 
Message9  DB   'Please enter valid sign$'
quo       DB    0 
remi      DB    0


.CODE
 MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX 
    
    LEA DX,Newline
    MOV AH,9         ;newline
    INT 21H 
    
    LEA DX,Message1
    MOV AH,9         ;for message1
    INT 21H 

        
    LEA DX,Newline
    MOV AH,9         ;newline
    INT 21H 
        
 START_:
   
    LEA DX,Newline
    MOV AH,9         ;newline
    INT 21H  
      
      
    LEA DX,Message2
    MOV AH,9
    INT 21H         ;for message2
    
    MOV AH,1
    INT 21H         ;moving the operator in AL resisstor
    MOV operator,AL ;legal for registor to memory  moving  
            
             
    LEA DX,newline
    MOV AH,9        ;newline
    INT 21H 
    

            
    LEA DX,Message3
    MOV AH,9         ;for message3
    INT 21H
   
    
   MOV AH,1       ;input for the first number
   INT 21H
   SUB AL,48      ;convert the ascii2 character
   MOV Number1,AL ;legal for memory moving  
  
           
    LEA DX,newline 
    MOV AH,9       ;for new line
    INT 21H 
            
  
   
  LEA DX,Message4
  MOV AH,9        ;for new line 
  INT 21H
    
 MOV AH,1
 INT 21H
 SUB AL,48 ;convert to ascii 2 character
 MOV Number2,AL
 
 ;JE is the Jump if equal     
  
    CMP operator,'+' ;for comparing the operation want to perform
    JE Addition
    
    CMP operator,'-'       
    JE  subtraction      ;for comparing the operation want to perform
    
     CMP operator,'*'
    JE   Multiplication   ;for comparing the operation want to perform  
    
        
    CMP operator,'/'  ;for comparing the operation want to perform
    JE  DivsionR    
    
    JMP invalid   ;No sign use then show an invalid message
    
    
    Addition:
      
      
    ;in this block its additon          
             
    LEA DX,newline
    MOV AH,9         ;for new line
    INT 21H 
     
          
    LEA DX,Message5
    MOV AH,9         ;for message5
    INT 21H   
    
    LEA DX,newline
    MOV AH,9         ;for new line 
    INT 21H
    
     
     MOV Bl,Number1 ;this moving b1=number1
     ADD Bl,number2 ; adding to b1=b1+number2 
     ;printing the value
     
     MOV AH,2
     CMP bl,9  ;compare if bl>9     
     JG p1      ;Jump for printing 1
     JMP printsum ;if not the go to print sum 
    
p1:
   SUB bl,10 ;if value is 13 the 13-10=3 
   MOV AH,2 
   MOV DL,49 ;if additon is greater than 9 then it will print 1
   INT 21H     
     
printsum:
    

    ADD Bl,48    ;then 48+3=51 which asciII=3       
    MOV DL,BL
    INT 21H
      
    LEA DX,newline
    MOV AH,9       ;new line 
    INT 21H       
    
    
    LEA DX,Message7
    MOV AH,9
    INT 21H         ;For message7
    
     LEA DX,newline
    MOV AH,9        ;new line
    INT 21H 
    
    
    LEA DX,Message8
    MOV AH,9         ;for message8
    INT 21H 
    
    LEA DX,newline
    MOV AH,9         ;for new line
    INT 21H 
             
    CALL TNX   ;if we use call operator then it will bring its called method
  
    LEA DX,newline
    MOV AH,9        ;for new line
    INT 21H 
  
    
    MOV AH,1
    INT 21H 
    
    MOV BL,AL
    CMP BL,'1'   ;compare to 1 if 1 then start AGAIN CALCULATION
    JE START_
    
    
    LEA DX,newline
    MOV AH,9       ;FOR NEW LINE
    INT 21H
                        
    JMP EXIT
    
subtraction:       ;this for subtraction block
      
    LEA DX,newline
    MOV AH,9          ;for new line
    INT 21H
      
    
    LEA DX,Message10
    MOV AH,9         ;for message9
    INT 21H 
           
    LEA DX,newline
    MOV AH,9
    INT 21H       
           
           
    MOV AH, 2            
    MOV CH,Number1  ;ch=number1
    CMP CH, Number2 ;compare ch<number 2 then print a '-' character 
    JL printminus
    
    
    SUB CH,Number2  ;if not use the sub ch=ch-number2
    JMP prints2
     
printminus:
    MOV DL,45       ;print'-'
    INT 21H      
    MOV CH,Number2  ;ch=number2  
    
    SUB CH,Number1  ;sub ch=ch-number1 
prints2:
     
    MOV DL,CH       ;if  ch>number2 then print with ASCII CHARARTER
    ADD DL,48
    INT 21H 
    
    CALL TNX
    
    
     LEA DX,newline
    MOV AH,9       ;new  LINE
    INT 21H       
    
    
    LEA DX,Message7
    MOV AH,9
    INT 21H         ;For MESSAGE7
    
     LEA DX,newline
    MOV AH,9
    INT 21H 
    
    
    LEA DX,Message8
    MOV AH,9
    INT 21H 
    
     LEA DX,newline
    MOV AH,9
    INT 21H 
    
    
     
    MOV AH,1
    INT 21H 
    
    MOV BL,AL
    CMP BL,'1'
    JE START_
    
    
    LEA DX,newline
    MOV AH,9
    INT 21H
           
    
    
    
    JMP EXIT
 
 
 
 
 

Multiplication:
 
       
     LEA DX,newline
    MOV AH,9              ;new line asking for again calculation
    INT 21H       
    
    
    LEA DX,Message11
    MOV AH,9
    INT 21H               ;For second time want to calculate
 
     
     
       
     LEA DX,newline
    MOV AH,9              ;new line asking for again calculation
    INT 21H  
     
 
    MOV AL, Number1       ;taking first number
    MUL Number2           ;then multiplying with 2nd number number2=al*2nd 
    MOV CL,AL             ;moving value in cl
    
    
    MOV AH,2              ;HERE COMPARING THE VALUE IF GREATER THEN 10 THEN DECMAL
    CMP AL, 10
    JGE printmultidecimal
    JMP printmultirest    ;IF NOT JUST PRINT RESULT
 
printmultidecimal:  ;priting decimal number value
      
    
    MOV AH, 0   ;changing ah value=0
    MOV BL, 10  ;bl value 10
    
               
               
    DIV BL       ;Ah=Ah/BL  
    
    MOV CL, AH   ;moving ah to cL
        
    ADD AL, 48   ;AL character print
    MOV DL, AL
    MOV AH, 2
    INT 21H
    
    ADD CL, 48   ;cl character print
    
    MOV AH,2
    MOV DL, CL
    INT 21H
    
 
    
    
      
    
     LEA DX,newline
    MOV AH,9       ;new line asking for again calculation
    INT 21H       
    
    
    LEA DX,Message7
    MOV AH,9
    INT 21H         ;For second time want to calculate
    
     LEA DX,newline
    MOV AH,9
    INT 21H 
    
    
    LEA DX,Message8
    MOV AH,9
    INT 21H 
    
     LEA DX,newline
    MOV AH,9
    INT 21H 
    
    
     
    MOV AH,1
    INT 21H 
    
    MOV BL,AL
    CMP BL,'1'
    JE START_
    
    
    LEA DX,newline
    MOV AH,9
    INT 21H
           
    
    JMP EXIT

 printmultirest:  
 
 
 
    MOV DL, AL  ;prting the multiple value just not decimal value  
    ADD DL, 48  ;for ascii 2 table value 
    MOV AH, 2
    INT 21H  
    
    
    
    
         
      
    
     LEA DX,newline
    MOV AH,9       ;new line asking for again calculation
    INT 21H       
    
    
    LEA DX,Message7
    MOV AH,9
    INT 21H         ;For second time want to calculate
    
     LEA DX,newline
    MOV AH,9
    INT 21H 
    
    
    LEA DX,Message8
    MOV AH,9
    INT 21H 
    
     LEA DX,newline
    MOV AH,9
    INT 21H 
    
    
     
    MOV AH,1
    INT 21H 
    
    MOV BL,AL
    CMP BL,'1'
    JE START_
    
    
    LEA DX,newline
    MOV AH,9
    INT 21H
    
    
    
    JMP EXIT      
           
           
           
           
 DivsionR:
 
    LEA DX,newline
    MOV AH,9       ;new line 
    INT 21H       
    
    
    LEA DX,Message12
    MOV AH,9
    INT 21H         ;For message 12
 
     
     
       
    LEA DX,newline
    MOV AH,9        ;new line 
    INT 21H  
    
    
    MOV AX,0
    MOV al,Number1  ;al=number1
    MOV bh,Number2  ;bh=Number2
    DIV bh          ; al=al/bh
    Mov cl,al       ; result in cl
    ADD Cl,48       ;show in decimal
    mov ch,ah       ; reminder  is in ah register to moving to ch register
    ADD ch,48       ; show in decimal
    
 
    
    LEA DX,Message13 
    MOV AH,9       ;new line 
    INT 21H   
    
    mov ah,2
    mov dl,cl  ;qoutinet
    int  21h 
    
    LEA DX,newline
    MOV AH,9       ;new line 
    INT 21H  
    
    LEA DX,Message14
    MOV AH,9
    INT 21H         ;For message 14
 
    
    
     mov ah,2
     mov dl,ch  ;reminder
     int 21h

    
          
    
    LEA DX,newline
    MOV AH,9       ;new line asking for again calculation
    INT 21H   
      
    


    
    LEA DX,Message7
    MOV AH,9
    INT 21H         ;For second time want to calculate
    
     LEA DX,newline
    MOV AH,9
    INT 21H 
    
    
    LEA DX,Message8
    MOV AH,9
    INT 21H 
    
     LEA DX,newline
    MOV AH,9
    INT 21H 
    
    
     
    MOV AH,1
    INT 21H 
    
    MOV BL,AL
    CMP BL,'1'
    JE START_
    
    
    LEA DX,newline
    MOV AH,9
    INT 21H
    
    
    
    
    
    
    JMP EXIT
         
 
    
     
    TNX:
    
    LEA DX,Newline
    MOV AH,9         
    INT 21H 
    
    LEA DX,Message6
    MOV AH,9           ;it is returing value
    INT 21H
    RET 
     
    
Invalid:  ;if press an invalid it will restart the program
        
    LEA DX,Newline
    MOV AH,9         
    INT 21H
        
     
    LEA DX,Message9
    MOV AH,9
    INT 21H   
    
    JMP START_
    
    EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN