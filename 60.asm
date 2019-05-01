.MODEL SMALL
 .STACK 100H

 .DATA
   PROMPT_1  DB  'Enter a decimal digit string : $'
   PROMPT_2  DB  0DH,0AH,'The sum of the decimal digit string in Hex is : $'
   ILLEGAL   DB  0DH,0AH,'Illegal character. Try again : $'

   TEMP      DW  ?
   VALUE     DW  ?
   v         dw  ?

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX

     LEA DX, PROMPT_1             ; load and display the string PROMPT_1
     MOV AH, 9
     INT 21H

     JMP @START_2                 ; jump to label @START_2 

     @START_1:                    ; jump label
       LEA DX, ILLEGAL            ; load and display the string ILLEGAL 
       MOV AH, 9
       INT 21H

     XOR BX, BX                   ; clear BX
     XOR CX, CX                   ; clear CX

     @START_2:                    ; jump label
       MOV AH, 1
       INT 21H

       INC CX                     ; increment CX

       CMP AL, 0DH                ; compare AL with CR
       JNE @SKIP                  ; jump to label @SKIP if AL!=CR

       CMP CX, 1                  ; compare CX with 1
       JB @START_1                ; jump to label @START_1 if CX<1
       JMP @END_INPUT             ; jump to label @END_INPUT

       @SKIP:                     ; jump label

       CMP AL, 30H                ; compare AL with 0
       JB @START_1                ; jump to label @START_1 of AL<0

       CMP AL, 39H                ; compare AL with 1
       JA @START_1                ; jump to label @START_1 if AL>9

       AND AL, 0FH                ; convert the ascii to decimal code
       XOR AH, AH                 ; clear AH
       ADD BX, AX                 ; add BX and AX

       JMP @START_2               ; jump to label @START_2

     @END_INPUT:                  ; jump label

     LEA DX, PROMPT_2             ; load and display the string PROMPT_2
     MOV AH, 9
     INT 21H

     MOV CX, 4                    ; initialize loop counter
     MOV AH, 2                    ; set output function

     @LOOP_1:                     ; loop label
       XOR DX, DX                 ; clear DX

       @LOOP_2:                   ; jump label
         SHL BX, 1                ; shift BX towards left by 1 position
         RCL DL, 1                ; rotate DL towards left by 1 position
         INC DH                   ; increment DH
         CMP DH, 4                ; compare DH with 4
       JNE @LOOP_2                ; jump to label @LOOP_2 if DH!=4

       CMP DL, 9                  ; compare DL with 9
       JBE @NUMERIC_DIGIT         ; jump to label @NUMERIC_DIGIT if DL<=9
       SUB DL, 9                  ; convert it to number i.e. 1,2,3,4,5,6
       OR DL, 40H                 ; convert number to letter i.e. A,B...F
       JMP @DISPLAY               ; jump to label @DISPLAY

       @NUMERIC_DIGIT:            ; jump label
         OR DL, 30H               ; convert decimal to ascii code

       @DISPLAY:                  ; jump label
         INT 21H                  ; print the character
     LOOP @LOOP_1                 ; jump to label @LOOP_1 if CX!=0

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIn ENDP   
 END MAIN