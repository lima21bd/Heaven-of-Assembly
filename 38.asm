.model small
.stack 100h

.data
a db 'Enter a character: $'

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
    
    cmp bh , 'y'
    je then
    cmp bh , 'Y'
    je then
    
    jmp else
    
    then:
    
    mov ah , 2
    mov dl , 10
    int 21h
    mov dl , 13
    int 21h
    
    mov ah , 2
    mov dl , bh
    int 21h
    
    else:
    
    mov ah , 4ch
    int 21h
    main endp
end main