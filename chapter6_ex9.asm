;CHAPTER 6 EX_9

.MODEL SMALL 
.STACK 100H
.DATA
.CODE

 MAIN PROC

 MOV CX,127 ;initialize number of character
 MOV BL,0

PRINT:

 MOV AH,2
 INC CX
 CMP CX,255
 JA EXIT
 MOV DX,CX
 INT 21h
 MOV DX,32D ; giving space
 INT 21h
 JMP GO


GO:

 INC BL
 CMP BL,10 ; 10 char per line
 JE NEWLINE
 JMP print


NEWLINE:
 MOV AH,2
 MOV DL,0dh
 int 21h
 mov dl,0ah
 int 21h
 MOV BL,0
 JMP PRINT

EXIT: 

   