.model small
.stack 100h

.data

prompt db  'Enter a hex string : $'
msg db 10, 13, 'In binary it is $'
msg2 db 10, 13, 'Invalid Input. Try again! $'

.code

main proc
    
    mov ax , @data
    mov ds , ax 
    
    mov ah , 9
    lea dx , prompt
    int 21h
    
    input:
    
    mov bx , 0
    mov cl , 4
    mov ah , 1
    int 21h
    
    while_:
    
    cmp al , 0dh
    je output
    
    cmp al, '0'
    jl error
    cmp al , '9'
    jg letter 
    
    and al , 0Fh
    jmp shift
    
    letter:
    
    cmp al , 'F'
    jg error
    cmp al , 'A'
    jl error
    
    sub al , 37h 
    
    shift:
    
    shl bx , cl
    or bl, al
    int 21h
    jmp while_
    
    output:
    
    mov ah , 9
    lea dx , msg
    int 21h
    
    mov ah , 2
    mov cx , 16
    
    top:
    
    shl bx , 1
    jc set
    
    mov dl , '0'
    int 21h
    jmp label 
    
    set:
    
    mov ah , 2
    mov dl , '1'
    int 21h
    
    label:
    
    loop top
    jmp exit
    
    error:
    
    mov ah , 9
    lea dx , msg2
    int 21h
    
    jmp input
    
    exit:
    
    mov ah , 4ch
    int 21h
    main endp
end main