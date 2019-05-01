.model small
.stack 100h

.code

main proc
    
    
    mov cl , 0
    
    mov ah , 1
    int 21h
    
    while:
    
    cmp al , 0dh
    je exit
    
    inc cl
    
    int 21h
    
    jmp while
    
    exit:
    
    mov ah , 2
    mov dl , 10
    int 21h
    mov dl , 13
    int 21h 
    
    add cl , 48
    
    mov ah , 2
    mov dl , cl
    int 21h
    
    mov ah , 4ch
    int 21h
    main endp
end main
    
    