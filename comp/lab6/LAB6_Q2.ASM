DATA SEGMENT
NUM1 DW 000AH
NUM2 DW 0004H
NUM3 DW 0012H
NUM4 DW 0006H
RES DW ?
DATA ENDS

CODE SEGMENT
	ASSUME CS:CODE, DS:DATA

START:   
	 MOV AX,DATA     
         MOV DS,AX
         MOV AX,NUM1   
         MOV BX,NUM2
         CALL GCD
	 MOV CX,RES 
	 MOV AX,NUM3   
         MOV BX,NUM4
         CALL GCD
	 MOV DX,RES
	 MOV AX,CX   
         MOV BX,DX
         CALL GCD	
	 MOV AH,4CH
	 INT 21H 
GCD:     
         
UP:   
	 CMP AX,BX        
         JE EXIT          
         JB EXCG          
                       
UP1:     MOV DX,0H      
         DIV BX          
         CMP DX,0        
         JE EXIT         
         MOV AX,DX      
         JMP UP          
EXCG:
	 XCHG AX,BX      
         JMP UP1         
EXIT:
	MOV RES,BX     
        RET

CODE ENDS
END START
