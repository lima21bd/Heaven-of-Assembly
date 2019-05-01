.model small
.stack 100h

.data
a db 'ENTER A HEX DIGIT: $'
b db 10,13,'IN DECIMAL IT IS: $'
c db '1$'

.code 

main proc
      
    mov ax , @data
    mov ds , ax 
    
    mov ah , 9
    lea dx , a
    int 21h 
    
    mov ah , 1
    int 21h
    mov bh , al
     
    mov ah , 9
    lea dx , b
    int 21h 
      
    mov ah , 9
    lea dx , c
    int 21h
     
    sub bh , 17
    mov ah , 2
    mov dl , bh
    int 21h 
    
    exit:
    
    mov ah , 4ch
    int 21h
    main endp
end main
