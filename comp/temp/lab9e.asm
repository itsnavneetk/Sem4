DIS MACRO STR
LEA DX,STR
MOV AH,09H

INT 21H
ENDM
DATA SEGMENT
    MSG1 DB "ENTER YOUR STRING : $"
    MSG2 DB "CONVERTED STRING IS : $"
    STR1 DB 20 DUP('$')
    LINE DB 10,13,'$'
DATA ENDS

CODE SEGMENT
          ASSUME DS:DATA,CS:CODE
START:
        MOV AX,DATA
        MOV DS,AX
        DIS MSG1
        LEA DX,STR1
        MOV AH,0AH
        INT 21H
        DIS LINE
        DIS LINE
        
        MOV CH,00
        MOV CL,BYTE PTR[STR1+1]
        LEA SI,STR1+2
    L1: MOV AH,BYTE PTR[SI]
        CMP AH,'A'
        JL L3
        CMP AH,'Z'
        JG L2
        ADD BYTE PTR[SI],32
        JMP L3
     L2:CMP AH,'a'
        JL L3
        CMP AH,'z'
        JG L3
        SUB BYTE PTR[SI],32
     L3:INC SI
        LOOP L1
        DIS MSG2
        DIS STR1+2
     L4:MOV AH,4CH
        INT 21H
CODE ENDS
END START
