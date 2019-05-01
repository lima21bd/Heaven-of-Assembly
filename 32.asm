.model small
.stack 100h 

.data
a db 'Enter first digit: $'
b db 10, 13,'Enter second digit: $'
c db 10, 13, 'Biggest Number Is: $'

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
    jge keep
    
    mov al , bl 
    
    mov ah , 2
    mov dl , al
    int 21h
    
    jmp exit
    
    keep:
    
    mov al , bh
    
    mov ah , 2
    mov dl , al
    int 21h
    
    exit:
    
    mov ah , 4ch
    int 21h
    main endp
end main