.model small
.stack 100h

.code

main proc
    
    mov cx , 0
    
    level1:
    
    mov bx , cx
    mov cx , 10
    
    level2:
    
    mov ah , 2 
    mov dl , bl
    int 21h
    
    inc bl

    cmp bl, 255
    je exit

    loop level2 
    
    mov ah , 2
    mov dl , 10
    int 21h
    mov dl , 13
    int 21h  
    
    inc bl

    mov cx , bx

    loop level1
    
    exit:
    
    mov ah , 4ch
    int 21h
    main endp

end main
    
    
    
    
    