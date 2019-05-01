.model small
.stack 100h

.data
a db 'Enter First Digit: $'
b db 10, 13, 'Enter Second Digit: $'
c db 10, 13, 'Bigger Digit: $'

.code

main proc
    
    mov ax , @data
    mov ds , ax
    
    mov ah , 9
    lea dx , a
    int 21h
    
    mov ah , 1
    int 21h
    mov bl , al
    
    mov ah , 9
    lea dx , b
    int 21h
    
    mov ah , 1
    int 21h
    mov bh , al 
    
    Bigger:
    
    cmp bl , bh
    jg level1
    jmp level2
              
              
    level1:
    
    mov ah , 9
    lea dx , c
    int 21h
    
    mov ah , 2
    mov dl , bl
    int 21h
    
    jmp exit
    
    level2:
    
    mov ah , 9
    lea dx , c
    int 21h
    
    mov ah , 2
    mov dl , bh
    int 21h
    
    jmp exit 
    
    exit:
    
    mov ah , 4ch
    int 21h
    main endp

end main
    