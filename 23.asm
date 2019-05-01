.model small
.stack 100h

.data

a db 'Enter a binary number: $'
b db 10, 13, 'The binary number in same order is: $'  

.code

main proc
    
    mov ax , @data
    mov ds , ax
    
    mov ah , 9
    lea dx , a
    int 21h
    
    mov cx , 8
    
    input: 
    
    mov ah , 1
    int 21h
    
    cmp al , 13
    je process
    
    and al , 0Fh
    
    shl bl , 1
    or bl , al
    
    loop input 
    
    process:
    
    mov al , bl
    
    mov cx , 8
    
    reverse:
    
    shl al , 1
    rcl bl , 1
    
    loop reverse
    
    mov ah , 9
    lea dx , b
    int 21h
    
    mov cx , 8
    mov ah , 2
    
    output:
    
    rol bl , 1
    
    jnc zero
    
    mov dl , 31h
    jmp display
    
    zero:
    
    mov dl , 30h
    
    display:
    
    int 21h
    
    loop output
    
    mov ah , 4ch
    int 21h
    main endp
end main
    
    
