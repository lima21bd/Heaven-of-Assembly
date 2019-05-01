.model small
.stack 100h
.code

main proc
    
    mov ah , 1
    int 21h 
    mov bl,al
    
    
    cmp bl , "1"
    je odd
    cmp bl , "3"
    je odd 
    
    cmp bl , "2"
    je even
    cmp bl , "4"
    je even
    
    jmp exit
    
    
    odd:
    
    mov ah , 2
    mov dl , 'o'
    int 21h
    
    jmp exit 
    
    
    even:
    
    mov ah , 2
    mov dl , 'e'
    
    int 21h 
    
    exit:
    
    mov ah , 4ch
    int 21h
    main endp
end main