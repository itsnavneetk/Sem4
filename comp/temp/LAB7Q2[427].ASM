DATA SEGMENT
A DB 10H,09H,12H,06H,22H
LEN DB 4 
SMALLEST DB ?
DATA ENDS

PRINT MACRO M
        LEA DX,M
        MOV AH,09H
        INT 21H
        ENDM

CODE SEGMENT
        ASSUME DS:DATA, CS:CODE
START:
        MOV AX,DATA
        MOV DS,AX

        MOV CL,LEN
        MOV CH,00H ; CX=LENGTH OF ARRAY

        LEA SI,A
        MOV BH,BYTE PTR [SI]
        MOV SMALLEST,BH
        INC SI ; SMALLEST=A[0],SI=1

BACK:
        MOV AL,[SI]     ;AL=A[1]
        CMP SMALLEST,AL
        JC SMALL
        INC SI
        JMP REV
        JMP EXIT
SMALL:
        MOV SMALLEST,AL
REV:
        LOOP BACK
EXIT:
        MOV AH,4CH
        INT 21H

CODE ENDS
END START


