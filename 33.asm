.model small
.stack 100h

.data
a db 'Enter a digit: $'
b db 10, 13,'Output: $'


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
    jl negation


    mov ah , 2
    mov dl , bh
    int 21h 
    
    jmp exit
    
    negation:
    
    neg bh
    
    mov ah , 2
    mov dl , bh
    int 21h
     
    jmp exit
    
    exit:
    
    mov ah , 4ch 
    int 21h
    main endp
end main
    
    
     
    