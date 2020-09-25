.model small
.stack 100h
.data
msg db 'Ralsei!', 0dh, 0ah, '$'
.code
main proc
    mov ax, @data
    mov ds, ax

    lea dx, msg
    mov ah, 9h
    mov cx, 5h
L1: int 21h
    loop L1

    mov ax, 4c00h
    int 21h
main endp
end main

