.model small
.stack 100h

.data
a db 'Enter a digit: $' 
b db 10, 13, 'output: $' 
c db ?

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
    
    cmp bh , '0'
    
    jl negative
    je zero
    jg positive
    
    negative:
    
    mov c , 0ffh
    
    mov ah , 2 
    mov dl , c
    int 21h
    
    jmp exit
    
    zero:
    
    mov c , 30h
    
    mov ah , 2 
    mov dl , c
    int 21h
    
    jmp exit
    
    positive:
    
    mov c , 31h
    
    mov ah , 2 
    mov dl , c
    int 21h 
    
    exit:
    
    mov ah , 4ch
    int 21h
    main endp
end main