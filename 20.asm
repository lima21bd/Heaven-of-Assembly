.model small
.stack 100h

.data

a db 10, 13, 'Enter a character: $'
b db 10, 13, 'The ascii code of the given character in HEX form is: $'

.code

main proc
    
    mov ax , @data
    mov ds , ax
    
    input:
    
    mov ah , 9
    lea dx , a
    int 21h
    
    mov ah , 1
    int 21h
    
    mov bl , al
    
    cmp bl , 13
    je exit
    
    mov ah , 9
    lea dx , b
    int 21h
    
    xor dx , dx
    mov cx , 4
    
    loop1:
    
    shl bl , 1
    rcl dl , 1
    
    loop loop1
    
    mov cx , 4 
    
    loop2:
    
    shl bl , 1
    rcl dh , 1
    
    loop loop2
    
    mov bx , dx
    mov cx , 2
    
    loop3:
    
    cmp cx , 1
    je second_digit
    
    mov dl , bl
    
    jmp next
    
    second_digit:
    
    mov dl , bh
    
    next:
    
    mov ah , 2
    
    cmp dl , 9
    jbe numeric_digit
    
    sub dl , 9
    add dl , 40h
    jmp display
    
    numeric_digit:
    
    or dl , 30h
    
    display:
    
    int 21h 
    
   loop loop3 
    
   jmp input
    
    exit:
    
    mov ah , 4ch
    int 21h
    main endp
end main
    
    
    
 