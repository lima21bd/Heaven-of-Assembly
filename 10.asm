.model small
.stack 100h

.data
a db 'Enter a letter: $'
b db 10, 13, 'Converted letter: $'


.code

main proc
    
    mov ax , @data
    mov ds, ax
    
    mov ah , 9
    lea dx , a
    int 21h
    
    mov ah , 1
    int 21h
    mov bh , al
    
    mov ah , 9
    lea dx , b
    int 21h 
    
    cmp bh , 90
    
    jg convert_to_small
    
    add bh , 32 
    
    mov ah , 2
    mov dl , bh
    int 21h
    
    jmp exit 
    
    convert_to_small:
    
    sub bh , 32 
    
    mov ah , 2
    mov dl , bh
    int 21h
    
    exit:
    
    mov ah, 4ch
    int 21h
    main endp
end main
     
    
    