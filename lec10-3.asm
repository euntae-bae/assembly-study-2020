.model small
.stack 100h
.data
str1 db 'Hello, World', 0dh, 0ah, '$'
str2 db 'I like cats', 0dh, 0ah, '$'

.code
main proc far
    mov ax, @data
    mov ds, ax
    lea dx, str1
    call nearStr
    lea dx, str2
    call nearStr
    mov ax, 4c00h
    int 21h
main endp

nearStr proc near
    push ax
    mov ah, 9h
    int 21h
    pop ax
    ret
nearStr endp
end main