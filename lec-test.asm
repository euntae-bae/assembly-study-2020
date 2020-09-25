.model small
.stack 100h
.data
.code
main proc
    mov ax, @data
    mov ds, ax
    mov ax, 0

    stc
    mov al, 9ah
    rcl al, 1
    rcl al, 1
    rcl al, 1

    mov ax, 4c00h
    int 21h
main endp
end main