;password, display, palindrome

data SEGMENT
        A DB 'ENTER PASS - $'
        B DB 6 DUP(0)
        C DB '*$'
        D DB '123456'
        B2 DB 6 DUP('$')
        MSG DB 'VALID $'
        MSG2 DB 'INVALID $'
        MSG3 DB 10, 13, '$'
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
        MOV AX, DATA
        MOV DS, AX
        LEA SI, B
        LEA DX, A
        MOV AH, 09
        INT 21H         ;PRINT

        MOV CX, 06
BACK:
        MOV AH, 08H
        INT 21H
        MOV [SI], AL
        INC SI
        LEA DX, C
        MOV AH, 09H
        INT 21H
        LOOP BACK        ;INPUT

        LEA DX, MSG3
        MOV AH, 09H
        INT 21H
        MOV CX, 06
        LEA SI, B
BACK1:                   ;DISPLAY ENTERED B       
        MOV DL, [SI] 
        MOV AH, 02H
        INT 21H
        INC SI
        LOOP BACK1
        dec si

        LEA DX, MSG3
        MOV AH, 09

        INT 21H
        MOV CX, 06
        LEA DI, b2

BACK2:                   ; PALIDROME IN B2
        MOV BL, [SI]
        MOV [DI], BL
        INC DI
        DEC SI
        LOOP BACK2
        
        MOV CX, 06
        lea di, b2
BACK3:  MOV DL, [DI]    ;display 
        MOV AH, 02
        INT 21H
        INC DI
        LOOP BACK3
        mov bh, '$'
        mov [di], bh

        lea dx, b2
        mov ah, 09h
        int 21h

        MOV AH, 4CH
        INT 21H 
CODE ENDS
END START   
