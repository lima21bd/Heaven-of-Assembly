.model small
.stack 100h 

.data 
a db 'Enter First Digit: $'
b db 10, 13, 'Enter Second Digit: $'
c db 10, 13, 'Enter Third Digit: $'
d db 10, 13, 'Biggest Digit: $' 

.code

main proc
    
    mov ax , @data
    mov ds , ax
    
    mov ah , 9
    lea dx , a
    int 21h
    
    mov ah , 1
    int 21h
    mov bl , al
    
    mov ah , 9
    lea dx , b
    int 21h
    
    mov ah , 1
    int 21h
    mov bh , al 
    
    mov ah , 9
    lea dx , c
    int 21h
    
    mov ah , 1
    int 21h
    mov cl , al 
    
    mov ah , 9
    lea dx , d
    int 21h
            
    
    cmp bl , bh
    jge level1
    
    level1:
    
    cmp bl , cl
    jge level2
    
    mov ah , 2
    mov dl , cl
    int 21h
    
    jmp exit
    
    level2:
    
    mov ah , 2
    mov dl , bl
    int 21h
    
    jmp exit
    
    level3:
    
    cmp bh , cl
    jge level4
    
    mov ah , 2
    mov dl , cl
    int 21h
    
    jmp exit
    
    level4:
    
    mov ah , 2
    mov dl , bh
    int 21h
    

    exit:

    mov ah , 4ch
    int 21h
    main endp

end main
    
    
    

