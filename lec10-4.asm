.model small
.stack 100h
.data
str1 db 'Hello, World', 0dh, 0ah, '$'
str2 db 'I like cats', 0dh, 0ah, '$'
str3 db 'I like 6502', 0dh, 0ah, '$'

.code
main proc far
    mov ax, @data
    mov ds, ax
    lea dx, str1
    push dx
    lea dx, str2
    push dx
    lea dx, str3
    push dx
    call threeStr
    mov ax, 4c00h
    int 21h
main endp

threeStr proc near
    push bp
    mov bp, sp
    push ax
    push dx
    
    mov ah, 9h
    mov dx, [bp+8]
    int 21h
    mov dx, [bp+6]
    int 21h
    mov dx, [bp+4]
    int 21h

    pop dx
    pop ax
    pop bp
    ret 6 ; 매개변수 크기: 6 바이트
threeStr endp
end main