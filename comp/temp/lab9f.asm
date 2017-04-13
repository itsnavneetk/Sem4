ASSUME CS : CODE, DS : DATA, ES : EXTRA
DATA SEGMENT
STRING1 DB 'EMPTY VESSELS MORE NOISE$'
STRLEN EQU ($-STRING1)
DATA ENDS
EXTRA SEGMENT
STRING2 DB STRLEN + 5 DUP(0)
EXTRA ENDS
CODE SEGMENT
START: MOV AX, DATA
       MOV DS, AX
       MOV SI, OFFSET STRING1
       MOV DI, OFFSET STRING2
       CLD
       MOV CX, 14
       REP MOVSB
       MOV DL, 5
BACK:  MOV AH, 01
       INT 21H
       STOS STRING2
       DEC DL
       JNZ BACK
       MOV CX,  11
       REP MOVSB
       NOP
       MOV AH, 4CH
       INT 21H
CODE ENDS
END START
END