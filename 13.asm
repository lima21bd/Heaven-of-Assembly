.model small
.stack 100h

.data
a db 'Enter a character: $'
b db 10, 13, 'Small Letter.$'
c db 10, 13, 'Capital Letter.$'
d db 10, 13, 'An ASCII character.$' 
e db 10, 13, 'Do you want to continue?$'
f db 'Illegal Character. Press Again!$'

.code

main proc
    
    mov ax , @data
    mov ds , ax 
    
    start:
    
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
    
    jmp again
    
    small: 
    
    cmp bh , 'a'
    jl ascii
    cmp bh , 'z'
    jg ascii
    
    mov ah , 9
    lea dx , b
    int 21h  
    
    jmp again
    
    ascii:
    
    mov ah , 9
    lea dx , d
    int 21h 
    
    jmp again
    
    again:
    
    mov ah , 9
    lea dx , e
    int 21h
    
    mov ah , 1
    int 21h
    mov bl , al 
    
    mov ah , 2
    mov dl , 10
    int 21h
    mov dl , 13
    int 21h
    
    cmp bl , 'Y'
    je  start
    cmp bl , 'y'
    je start
    
    cmp bl , 'N'
    je exit
    cmp bl , 'n'
    je exit 
    
    mov ah , 9
    lea dx , f
    int 21h 
    
    mov ah , 2
    mov dl , 10
    int 21h
    mov dl , 13
    int 21h
    
    jmp start
    
    exit:
    
    mov ah , 4ch
    int 21h
    main endp
end main