.model small
.stack 100h
.data
data1 dw 1020h
data2 dw 4080h
data3 dw 8088h
result1 dw ?
result2 dw ?

.code
main proc far
    mov ax, @data
    mov ds, ax

    push data1
    push data2
    push data3
    call sub1

    push data1
    push data2
    push data3
    call sub2
    add sp, 6

    mov ax, 4c00h
    int 21h
main endp

; stdcall
sub1 proc near
    push bp
    mov bp, sp
    push ax
    push bx
    push cx

    mov ax, [bp+8]  ; AX=data1
    mov bx, [bp+6]  ; BX=data2
    mov cx, [bp+4]  ; CX=data3
    add ax, bx
    add ax, cx
    mov result1, ax

    pop cx
    pop bx
    pop ax
    pop bp
    ret 6
sub1 endp

; cdecl
sub2 proc near
    push bp
    mov bp, sp
    push ax
    push bx
    push cx

    mov ax, [bp+8]  ; AX=data1
    mov bx, [bp+6]  ; BX=data2
    mov cx, [bp+4]  ; CX=data3
    add ax, bx
    add ax, cx
    mov result2, ax

    pop cx
    pop bx
    pop ax
    pop bp
    ret
sub2 endp
end main