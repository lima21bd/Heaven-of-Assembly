.model small
.stack 100h 

.data
a db '*$'


.code

main proc
    
    mov ax , @data
    mov ds , ax
    
    mov cx , 0
    
    mov ah , 2
    mov dl , a
    
    loop:
    
    int 21h
    
    inc cx 
    
    cmp cx , 80
    jl loop
    
    exit:
    
    mov ah , 4ch
    int 21h
    main endp
end main
    