DATA SEGMENT
A DB 62H, 30H, 5CH, 0EFH, 1DH, 98H, 75H, 46H, 0ACH, 6BH
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX

        MOV CX, 9
        MOV SI, 0

BACK:
        MOV DH, A[SI]
        MOV DI, SI
        MOV BX, DI
        INC DI
        
        BACK2:
                MOV DL, A[DI]
                CMP DH, DL
                JB SKIP
                MOV DH, DL
                MOV BX, DI
             SKIP: INC DI
                CMP DI, 9
                JBE BACK2

        MOV DI, BX
        MOV AH, A[SI]
        MOV AL, A[DI]
        MOV A[SI], AL
        MOV A[DI], AH

        INC SI
        LOOP BACK

        MOV AH, 4CH
        INT 21H
CODE ENDS
END START
