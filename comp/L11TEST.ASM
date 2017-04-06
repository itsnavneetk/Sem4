DATA SEGMENT
        msg DB 'HELLO'
        COL DB 40
DATA ENDS
ASSUME CS:CODE, DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX
        MOV AH, 0
        MOV AL, 3
        MOV DL, 00
        LEA DI, MSG
        MOV CL, COL

UP: MOV DH, [DI]
        PUSH DS
        MOV AX, 0B800H
        MOV AX, 
