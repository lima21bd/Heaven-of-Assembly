.model small
.stack 100h

.data
a db 'Enter a character: $'
b db 10, 13, 'Small Letter.$'
c db 10, 13, 'Capital Letter.$'
d db 10, 13, 'An ASCII character.$'

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
    
    cmp bh , 'A'
    jl ascii
    cmp bh , 'Z'
    jg small 
    
    mov ah , 9
    lea dx , c
    int 21h
    
    jmp exit
    
    small: 
    
    cmp bh , 'a'
    jl ascii
    cmp bh , 'z'
    jg ascii
    
    mov ah , 9
    lea dx , b
    int 21h  
    
    jmp exit
    
    ascii:
    
    mov ah , 9
    lea dx , d
    int 21h 
    
    exit:
    
    mov ah , 4ch
    int 21h
    main endp
end main