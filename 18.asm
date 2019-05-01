.model small
.stack 100h

.data
a db 'Enter a string of letters: $'
b db 10, 13, 'The consecutive increasing string: $'

.code

main proc
    
    mov ax , @data
    mov ds , ax
    
    mov ch , 0
    
    mov ah , 9
    lea dx , a
    int 21h
    
    input_1:
    
    mov ah , 1
    int 21h
    
    cmp al , 0dh
    
    je end_
    
    mov cl , 1
    
    mov bl , al
    
    mov dh , al
    
    input_2:
    
    int 21h
    
    cmp al , 0dh
    
    je end_
    
    inc bl
    
    cmp bl , al
    
    jne init
    
    inc cl
    
    jmp input_2
    
    init:
    
    cmp ch , cl
    jl update
    
    mov cl , 1
    
    mov bl, al
    
    mov dh , al
    
    jmp input_2
    
    update:
    
    mov ch , cl
    
    mov bh , dh
    
    mov cl, 1
    
    mov bl , al
    
    mov dh , al
    
    jmp input_2
    
    end_:
    
    cmp ch , cl
    jl reupdate 
    
    jmp end_2
    
    reupdate:
    
    mov ch , cl
    mov bh , dh
    jmp end_2
    
    end_2:
    
    mov ah , 9
    lea dx, b
    int 21h
    
    mov ah , 2
    mov dl , bh
    
    output:
    
    cmp ch , 0
    je finish
    
    dec ch
    
    int 21h
    
    inc dl 
    
    jmp output
    
    finish:
    
    mov ah , 4ch
    int 21h
    main endp
end main
    