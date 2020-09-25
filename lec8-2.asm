.model small
.stack 100h
.data
var1 db 11110000b

.code
main proc
    mov ax, @data
    mov ds, ax
    mov ax, 0

    ; AND
    mov al, var1
    and al, 11111111b   ; AL=0F0H
    mov al, var1
    and al, 00000000b   ; AL=00H
    
    ; OR
    mov al, var1
    or al, 11111111b    ; AL=0FFH
    mov al, var1
    or al, 0000000b     ; AL=0F0H

    ; XOR
    mov al, var1
    xor al, 11111111b   ; AL=0FH
    mov al, var1
    xor al, 00000000b   ; AL=F0H
    xor al, al          ; AL=00H

    ; NOT
    not al              ; AL=0FFH

    mov ax, 4c00h
    int 21h
main endp
end main