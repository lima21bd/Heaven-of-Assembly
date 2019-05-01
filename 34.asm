.model small
.stack 100h

.data
a db 'Enter the first character: $'
b db 10, 13,'Enter the second character: $'
c db 10, 13, 'The character which comes first in sequence: $'

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
    
    mov ah , 1
    int 21h
    mov bl , al
    
    mov ah , 9
    lea dx , c
    int 21h
    
    cmp bh , bl
    jae display
    
    mov ah , 2
    mov dl , bh
    int 21h
    
    jmp exit
    
    display: 
    
    mov ah , 2
    mov dl , bl
    int 21h
    
    exit:
    
    mov ah , 4ch
    int 21h
    main endp
end main
    
     
    
    
    
