.MODEL SMALL

.STACK 100H

.CODE

MAIN PROC

    MOV CX, 10

    MOV AH, 2

    MOV DL, 48

    

    TOP:

    INT 21H

    ADD DL, 1

    LOOP TOP

    MAIN ENDP

END MAIN