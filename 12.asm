.model small
.stack 100h

.code    

main proc
    
    mov bl , 0
    mov cl , 0
     
    
    while: 
    
    mov ah,1
    int 21h

    cmp al , 20h
    je process

    inc cl
    jmp while


    process:
     
    cmp cl , 9
    jle count

    sub cl , 10 
    
    inc bl

    jmp process

    count: 
    
    add bl , 30h
    add cl , 30h  
    

    mov ah , 2
    mov dl , 10
    int 21h
    mov dl , 13
    int 21h
    
    mov ah , 2
    mov dl , bl
    int 21h
    
    mov ah , 2
    mov dl , cl
    int 21h
    
    exit:

    mov ah , 4ch
    int 21h
    main endp 

end main
