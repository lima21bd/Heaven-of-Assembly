.model small
.stack 100h 

.code

main proc
    
    while:
    
    mov ah , 1
    int 21h
   
    cmp al , 0dh
    je process 
    
    jmp while
    
    process:
    
    mov ah , 2
    mov dl , 8
    int 21h
    int 21h
    int 21h
    int 21h
    int 21h
    int 21h
    
    mov ah , 2
    mov dl , 'X'
    int 21h
    int 21h
    int 21h
    int 21h
    int 21h
    
    exit:
    
    mov ah , 4ch
    int 21h
    main endp
end main
    
    
    