.model small
.stack 100h

.data

a db 'Enter a character: $'
b db 10, 13, 'The ascii code of the given character in binary is: $'
c db ? 
d db 10, 13, 'The number of 1 bits is: $'
e db ? 

.code

main proc
    
    mov ax , @data
    mov ds , ax
    
    mov ah , 9
    lea dx , a
    int 21h
    
    mov ah , 1
    int 21h 
    
    mov c , al
    mov e , al
    
    mov ah , 9
    lea dx , b
    int 21h
    
    mov cx , 8
    mov ah , 2
     
    top:
    
    shl c , 1
    
    jc set 
    
    mov dl , '0'
    int 21h
    
    jmp label

    set:
    
    mov dl , '1'
    int 21h
    
    jmp top
    
    
    label:
    
    loop top 
    
    mov ah , 2
    mov dl , 8
    int 21h
    int 21h
    mov dl , 9
    int 21h
    int 21h
    
    mov ah , 9
    lea dx , d
    int 21h 
    
    mov al , 0
    mov cx , 8
    
    
    top1:
    
    rol e , 1
    jnc next
    inc al
    
    
    next:
    
    loop top1
    
    add al , 30h
    
    mov ah , 2
    mov dl , al
    int 21h
    
    
    exit:
    
    mov ah , 4ch
    int 21h
    main endp
end main