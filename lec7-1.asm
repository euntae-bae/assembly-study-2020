.model small
.stack 100h
.data
byteVar1 db 10h
byteVar2 db 90h
wordVar1 dw 8000h ; -32768

.code
main proc
    mov ax, @data
    mov ds, ax

    ; ZF=1이 되는 경우(ZR)
    mov ax, 0
    mov al, 10h
    add al, 30h
    sub al, 40h         ; AL=0

    ; CF=1이 되는 경우(CY)
    ; 연산의 결과가 음수이므로(0B0H), SF=1
    mov al, 0f0h
    mov bl, 0c0h
    add al, bl          ; AL=0B0H

    ; 캐리가 포함된 덧셈과 뺄셈
    adc al, 10h         ; AL=0C1H
    stc                 ; set carry flag, 인위적으로 캐리 플래그를 1로 세트한다.
    sbb al, 10H         ; AL=0B0H

    ; SF=1이 되는 경우(NG)
    ; 80H는 -128로, 음수다.
    mov al, 0
    add al, byteVar1    ; AL=10H
    sub al, byteVar2    ; AL=80H (-128)

    ; CF=1, OF=1 (CY, OV)
    ; 음수와 음수를 더하여 양수가 됐기 때문에 오버플로우 발생
    cbw                 ; AX=0FF80H
    add ax, wordVar1    ; AX=7F80H

    mov ax, 4c00h
    int 21h
main endp
end main