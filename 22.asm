.model small
.stack 100h 

.data
a db 'Input : $'
b db 10, 13, 'Reverse Input : $'

.code

main proc
    
    mov ax , @data
    mov ds , ax
    
    mov ah , 9
    lea dx , a
    int 21h
    
    xor cx , cx
    
    input:
    
    mov ah , 1
    int 21h
    
    cmp al , 13
    je process 
    
    push ax
     
    inc cx 
    
    jmp input
    
    
    process:
    
    mov ah , 9
    lea dx , b
    int 21h
    
    jcxz exit
    
    mov ah , 2
    mov dl , 10
    int 21h
    mov dl , 13
    int 21h 
    
    top: 
    
    pop dx
    int 21h
    
    loop top
    
    exit:
    
    mov ah , 4ch
    int 21h
    main endp
end main
    
    