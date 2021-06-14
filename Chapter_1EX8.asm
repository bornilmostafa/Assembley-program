  ;ID no-17-35574-3
  ;CHAPTER_3;;;;EXCIRSE 8 PAGE 8


.MODEL SMALL 
.STACK 100H
.DATA

 msg1 DB 'THE SUM OF $'
 msg2 DB ' AND $'
 msg3 DB ' IS $'
 

.CODE


   MAIN PROC
        
     mov  ax,@data
     mov ds,ax
        
        mov AH,2
        mov DL,'?'
        int 21H
        
        
       mov AH,1
       int 21H
       mov BL,AL   
        
       
       
       
       
       mov AH,1
       int  21H
       mov  BH,AL 
        
        

       
       
       mov ah,2
       mov dl,10
       int 21h
       
       mov ah,2
       mov dl,13
       int 21h
       
          lea  dx,msg1
          mov ah,9
          int 21h
          
          mov AH,2
          mov DL,BL 
          int 21H 
          
          lea  dx,msg2
          mov ah,9
          int 21h  
          
           mov AH,2
          mov DL,BH 
          int 21H
          
          ADD BL,BH
                     
                     
          
          lea  dx,msg3
          mov ah,9
          int 21h 
             
           sub bl,48  
           
          
          mov ah,2
          mov DL,BL
          int 21H 
        
           
           
     
           mov ah,4ch
         int 21h

     
    
    
  MAIN  ENDP 
   
   END MAIN
   
   