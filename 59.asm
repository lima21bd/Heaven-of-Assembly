.model small
.stack 100h

.data
a db 'Enter Password : $'
ok db 10, 13, 'Correct Password $'
notok db 10, 13,'Wrong Password! $'
pass db 'assembly$'
pass1 dw 8

.code

main proc
    
    mov ax , @data
    mov ds , ax
    
    mov cx , pass1
    mov bx , offset pass
    
    mov ah , 9
    lea dx , a
    int 21h 
    
    level1:
    
    mov ah , 8
    int 21h
    
    cmp al , [bx]
    jne level2
    
    inc bx
    loop level1
    
    mov ah , 9
    lea dx , ok
    int 21h
    
    jmp exit  
    
    
    
    level2: 
    
    mov ah , 9
    lea dx , notok
    int 21h 
    
    exit:
    
    mov ah , 4ch
    int 21h
    main endp
    
    
    
    