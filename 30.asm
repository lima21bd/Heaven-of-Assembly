.model small
.stack 100h

.data
a db 'Enter two digit for swapping. $'
b db 10, 13, 'After swap: $' 

.code

main proc
    
    mov ax, @data
    mov ds , ax
    
    mov ah , 9
    lea dx , a 
    int 21h
    
    mov cx , 2
    
    input:
    
    mov ah , 1
    int 21h
    
    push ax
    
    loop input
    
    process:
    
    mov ah , 9
    lea dx , b
    int 21h 
    
    mov ah , 2 
    mov dl , 10
    int 21h
    mov dl , 13
    int 21h
    
    mov cx, 2
    
    top:
    
    pop dx
    int 21h 
    
    mov ah , 2 
    mov dl , 10
    int 21h
    mov dl , 13
    int 21h
    
    loop top
    
    exit:
    
    mov ah , 4ch
    int 21h
    main endp
end main
    