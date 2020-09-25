.model small
.stack 100h
.data
str1 db "Label1", "$"
str2 db "Label2", "$"

.code
main proc
    mov ax, @data
    mov ds, ax

    lea bx, Label1
    jmp bx
Label1:
    lea dx, str1
    jmp Next
Label2:
    lea dx, str2
Next:
    mov ah, 9h
    int 21h

    mov ax, 4c00h
    int 21h
main endp
end main