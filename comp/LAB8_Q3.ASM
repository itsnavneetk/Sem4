DATA SEGMENT
        N DB 'ENTER DECIMAL NUMBER 1 =$'
	N1 DB 'ENTER DECIMAL NUMBER 2 =$'
        NXLINE DB 10,13,'$'
        DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
     START:
        MOV AX,DATA
        MOV DS,AX

        LEA DX,N
        MOV AH,09
        INT 21H

        MOV AH,01 ;35 tens
        INT 21H
	MOV BL,AL
	SUB BL,30H ;5

	MOV AH,01 ;32 units
	INT 21H
	SUB AL,30H ;2
	
	XCHG AL,BL 
	MOV CL,10
	MUL CL	  ;50
	ADD AL,BL  ;52


        LEA DX,NXLINE
        MOV AH,09
        INT 21H

        MOV DX,00H
        MOV DL,AL
        add dl,30

        MOV AH,02
        INT 21H

        MOV AH,4CH
        INT 21H

     CODE ENDS
     END START
