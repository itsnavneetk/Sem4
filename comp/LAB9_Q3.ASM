Data segment
 msg1 db 'Enter main string'
 nxtline db 10,13,'$'
 msg2 db 'Enter sub string',10,13,'$'
 found db 'String found$'
 notfound db 'String not found$'
 main db 20 dup(?)
 substr db 10 dup(?)
 MS dw ?
 SSS dw ?
Data ends

print macro msg
 LEA DX, msg
 MOV AH, 09
 INT 21H
ENDM

Code segment
 assume cs:code, ds:data

Start:

 MOV AX, data
 MOV DS, AX; init DSR
 MOV ES, AX; INIT ESR

 CLD; DF=0

 ;to read
 
 MOV SI, 0
 PRINT msg1

 BACK1:
 MOV AH, 08
 INT 21H
 MOV main[SI], AL
 INC SI
 CMP AL, 0DH
 JNE BACK1

 PRINT NXTLINE

 MOV DI, 0
 PRINT msg2

 BACK2:
 MOV AH, 08
 INT 21H
 MOV substr[DI], AL
 INC DI
 CMP AL, 0DH
 JNE BACK2

 PRINT NXTLINE

 DEC SI
 DEC DI

 MOV MS, SI
 MOV SSS, DI


 MOV SI, 0
 MOV DI, 0

 find:
  MOV AL, MAIN[SI]
  CMP AL, SUBSTR[DI]
  JZ match
  INC SI
  JMP find

 
REPNE CMPSB



JE MATCH

PRINT notfound
JMP DONE

MATCH:
PRINT found

DONE:

 MOV AH, 4CH
 INT 21H

 Code ends
End Start
