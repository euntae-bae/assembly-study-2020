.model small
.stack 100h
.data
var1 db 11011010b
var2 db 10010011b

.386 ; 비트 회전 명령어도 시프트와 마찬가지로 1 이상의 즉시값을 이동할 비트수로 지정하려면 286 이상의 프로세서가 필요하다.
.code
main proc
    mov ax, @data
    mov ds, ax
    mov ax, 0

    mov al, var1    ; AL=0DAH
    ror al, 4       ; AL=0ADH, CF=1

    mov al, var1    ; AL=0DAH, CF=1
    rcr al, 4       ; AL=5DH, CF=1

    mov al, var2    ; AL=93H, CF=1
    rol al, 3       ; AL=9CH, CF=0

    mov al, var2    ; AL=93H, CF=0
    rcl al, 3       ; AL=9AH, CF=0

    mov ax, 4c00h
    int 21h
main endp
end main