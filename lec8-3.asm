.model small
.stack 100h
.data
var1 db 11001010b

.386
; 이동할 비트수를 1보다 큰 즉시값으로 지정하려면 80286이상의 프로세서를 사용해야 한다.
.code
main proc
    mov ax, @data
    mov ds, ax
    mov ax, 0

    mov al, var1    ; AL=0CAH
    shl al, 1       ; CF=1(CY), AL=10010100 (94H)
    shl al, 2       ; CF=0, AL=01010000 (50H)
    mov cl, 4
    ; shl과 sal은 부호 비트를 고려할 필요가 없기 때문에 연산상 동일하다.
    sal al, cl      ; CF=1, AL=00000000 (00H)

    mov ax, 1       ; AX=01H
    shl ax, 5       ; AX=20H -> 2^5

    mov al, var1    ; AL=0CAH
    shr al, 4       ; AL=00001100 (0CH), CF=1
    mov al, var1
    sar al, 4       ; AL=11111100 (0FCH), CF=1

    mov ax, 4c00h
    int 21h
main endp
end main