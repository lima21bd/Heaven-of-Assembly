.MODEL SMALL

.STACK 100H

.CODE

MAIN PROC

    MOV AH, 1

    INT 21H

    MOV BL, AL

    SUB BL, 48

    MOV BH, BL

    

    MOV AH, 2

    MOV DL, 0DH

    INT 21H

    MOV DL, 0AH

    INT 21H

    

    MOV CX, 0

    

    L1:

    MOV CL, BL

    

    TOP:

    MOV AH, 2

    MOV DL, '*'

    INT 21H

    LOOP TOP

    

    MOV AH, 2

    MOV DL, 0DH

    INT 21H

    MOV DL, 0AH

    INT 21H

    

    DEC BH

    CMP BH, 0

    JNE L1

    

    JMP EXIT:

    

    EXIT:

    MOV AH, 4CH

    INT 21H

    MAIN ENDP

END MAIN