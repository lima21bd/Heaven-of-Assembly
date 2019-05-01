.model small
.stack 100h

.data
a db 'Type a line of text: $'
b db 10 , 13, 'No capital. $'
c db 10 , 13, 'First Capital : '
d db '['
e db '  Last Capital : '
f db '@ $'

.code

main proc
    
    mov ax , @data
    mov ds , ax
    
    mov ah , 9
    lea dx , a
    int 21h
    
    mov ah , 1
    int 21h
    
    input:
    
    cmp al , 13
    je process
    
    cmp al , 'A'
    jl read_character
    cmp al , 'Z'
    jg read_character
    
    cmp al , d
    jnl check_last
    
    mov d , al
    
    check_last:
    
    cmp al , f
    jng read_character
    
    mov f , al
    
    read_character:
    
    int 21h
    jmp input
    
    process:
    
    cmp d , '['
    jne cap_message
    
    mov ah , 9
    lea dx , b
    int 21h
    
    jmp exit
    
    cap_message:
    
    mov ah , 9 
    lea dx , c
    int 21h
    
    exit:
    
    mov ah , 4ch
    int 21h
    main endp
end main
