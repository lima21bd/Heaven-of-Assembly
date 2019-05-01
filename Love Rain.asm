.model small
.stack 100h

.data 
s1 db ' $'
s2  db '  $'
s3 db '   $'
s4 db '    $'
s5 db '     $'
s6 db '      $'
s7 db '       $' 
s8 db '        $'
s9 db '         $'
s10 db '          $' 

a1 db '^$'
a3 db '^^^$'
a5 db '^^^^^$'
a7 db '^^^^^^^$'
a9 db '^^^^^^^^^$'
a11 db '^^^^^^^^^^^$'
a13 db '^^^^^^^^^^^^^$'
a15 db '^^^^^^^^^^^^^^^$'
a17 db '^^^^^^^^^^^^^^^^^$'
a19 db '^^^^^^^^^^^^^^^^^^^$'


.code

main proc
    
    mov ax , @data
    mov ds , ax
    
    mov ah , 9
    lea dx , s3
    int 21h
    lea dx , a5
    int 21h 
    lea dx , s5
    int 21h
    lea dx , a5
    int 21h
    
    mov ah , 2
    mov dl , 10
    int 21h
    mov dl , 13
    int 21h
    
    mov ah , 9
    lea dx , s2
    int 21h
    lea dx , a7
    int 21h
    lea dx , s3
    int 21h
    lea dx , a7
    int 21h 
    
    mov ah , 2
    mov dl , 10
    int 21h
    mov dl , 13
    int 21h 
    
    mov ah , 9
    lea dx , s1
    int 21h
    lea dx , a9
    int 21h
    lea dx , s1
    int 21h
    lea dx , a9
    int 21h 
    
    mov ah , 2
    mov dl , 10
    int 21h
    mov dl , 13
    int 21h 
    
    mov ah , 9
    lea dx , s1
    int 21h 
    lea dx , a19
    int 21h
    
    mov ah , 2
    mov dl , 10
    int 21h
    mov dl , 13
    int 21h
    
    mov ah , 9
    lea dx , s2
    int 21h 
    lea dx , a17
    int 21h
    
    mov ah , 2
    mov dl , 10
    int 21h
    mov dl , 13
    int 21h
    
    
    mov ah , 9
    lea dx , s3
    int 21h 
    lea dx , a15
    int 21h 
    
    mov ah , 2
    mov dl , 10
    int 21h
    mov dl , 13
    int 21h  
    
    mov ah , 9
    lea dx , s4
    int 21h 
    lea dx , a13
    int 21h
    
    
    mov ah , 2
    mov dl , 10
    int 21h
    mov dl , 13
    int 21h  
    
    mov ah , 9
    lea dx , s5
    int 21h 
    lea dx , a11
    int 21h
    
    mov ah , 2
    mov dl , 10
    int 21h
    mov dl , 13
    int 21h
    
    mov ah , 9
    lea dx , s6
    int 21h 
    lea dx , a9
    int 21h 
    
    
    mov ah , 2
    mov dl , 10
    int 21h
    mov dl , 13
    int 21h
    
    mov ah , 9
    lea dx , s7
    int 21h 
    lea dx , a7
    int 21h 
    
    mov ah , 2
    mov dl , 10
    int 21h
    mov dl , 13
    int 21h
    
    mov ah , 9
    lea dx , s8
    int 21h 
    lea dx , a5
    int 21h
    
    mov ah , 2
    mov dl , 10
    int 21h
    mov dl , 13
    int 21h
    
    mov ah , 9
    lea dx , s9
    int 21h 
    lea dx , a3
    int 21h 
    
    
    mov ah , 2
    mov dl , 10
    int 21h
    mov dl , 13
    int 21h
    
    mov ah , 9
    lea dx , s10
    int 21h 
    lea dx , a1
    int 21h
    
    exit:
    
    mov ah , 4ch
    int 21h
    main endp

end main
