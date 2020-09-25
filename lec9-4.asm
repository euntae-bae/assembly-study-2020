.model small
.stack 100h
.data
arr1 db 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
arr2 dw 197, 256, 99, 8088, 510, 634, -1
sum1 db 0
sum2 dw 0

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ax, 0
    lea si, arr1
    mov cx, 10
arrSum1:
    add al, [si]
    inc si
    loop arrSum1
    mov sum1, al

    mov ax, 0
    lea si, arr2
arrSum2:
    add ax, [si]
    add si, 2
    mov bx, [si]
    cmp bx, -1
    loopne arrSum2
    mov sum2, ax

    mov ax, 4c00h
    int 21h
main endp
end main