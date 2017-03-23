DATA SEGMENT
        N DB 'Enter number =$'
        N1 DB 10,13,'$'
        DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
     START:
        MOV AX,DATA
        MOV DS,AX

        LEA DX,N
        MOV AH,09 ;string
        INT 21H
        MOV AH,01 ; with echo 
        INT 21H
        LEA DX,N1
        MOV AH,09
        INT 21H
        MOV DX,00H
        MOV DL,AL
        LEA DX,N
        MOV AH,09 ;string
        INT 21H
	mov ah, 08 ;withut echo
        MOV AH,02 ;disp char
        INT 21H

        MOV AH,4CH
        INT 21H

     CODE ENDS
     END START
