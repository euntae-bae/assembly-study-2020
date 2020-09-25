.model small
.stack 100h
.data
msg db "Hello!", 0dh, 0ah, '$'
.code
main proc
    mov ax, @data
    mov ds, ax

    lea dx, msg
    mov ah, 9h
    mov cx, 5
showMsg:
    int 21h
    loop showMsg

    mov ax, 4c00h
    int 21h
main endp
end main