.model small
.stack 100h
.data
.code
main proc
    mov ax, @data
    mov ds, ax

    mov ax, 1234h
    mov bx, 4567h
    mov cx, 789ah

    push ax
    push bx
    push cx
    
    pop cx
    pop bx
    pop ax

    mov ax, 4c00h
    int 21h
main endp
end main