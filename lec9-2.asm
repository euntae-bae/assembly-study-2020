.model small
.stack 100h
.data
var1 db 10h
var2 db 20h
var3 db 5h
.code
main proc
    mov ax, @data
    mov ds, ax

    ; op1 < op2 => CF=1, SF=1, ZF=0
    mov al, var1
    sub al, var2
    ; op1 = op2 => CF=0, SF=0, ZF=1
    mov al, var1
    sub al, var1
    ; op1 > op2 => CF=0, SF=0, ZF=0
    mov al, var1
    sub al, var3

    ; op1 < op2 => CF=1, SF=1, ZF=0
    mov al, var1
    cmp al, var2
    ; op1 = op2 => CF=0, SF=0, ZF=1
    cmp al, var1
    ; op1 > op2 => CF=0, SF=0, ZF=0
    cmp al, var3

    mov ax, 4c00h
    int 21h
main endp
end main