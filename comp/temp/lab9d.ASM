DATA SEGMENT
MSG1 DB 'ENTER A CHARACTER$'
ENDL DB 10,13,'$'
MSG2 DB 'ENTER A NUMBER$'
MSG3 DB 'CHARACTER:$'
DATA ENDS

     PRINT MACRO MSG
     LEA DX,MSG
     MOV AH,09H
     INT 21H
     ENDM


CODE SEGMENT
  ASSUME CS:CODE, DS:DATA

   START:
     MOV AX,DATA
     MOV DS,AX

     PRINT MSG1  ; get with echo
     MOV AH,01H  ; reading the character in AL -> with echo
     INT 21H
     PRINT ENDL
        
     PRINT MSG3  ; display entered char
     PRINT ENDL
     MOV DL,AL
     MOV AH,02H  ; displaying the character stored in DL
     INT 21H
     PRINT ENDL

     PRINT MSG2  ; get without echo
     MOV AH,08H  ; reading the character in AL -> without echo
     INT 21H
     PRINT ENDL
     
     PRINT MSG3 ; display entered character
     PRINT ENDL
     MOV DL,AL
     MOV AH,02H ; display the character stored in DL
     INT 21H

     MOV AH,4CH
     INT 21H

   CODE ENDS
END START
