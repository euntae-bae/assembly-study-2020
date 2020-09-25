.model small
.stack 100h
.data
byteVar1 db 60h

.code
main proc
    mov ax, @data
    mov ds, ax

    ; 부호 없는 바이트 정수의 곱셈
    mov al, 80h
    mul byteVar1    ; AX=3000H

    ; 부호 있는 바이트 정수의 곱셈
    ; 부호가 있는 경우이므로, 80h는 음수로 인식된다.
    mov al, 80h
    imul byteVar1   ; AX=0D000H

    ; 부호 없는 워드 정수의 곱셈
    mov ax, 1000
    mov bx, 12
    mul bx          ; AX=2EE0H (12,000), DX=0000H

    ; 부호 있는 워드 정수의 곱셈
    mov ax, 5
    mov bx, -1
    imul bx         ; AX=0FFFBH, DX=0FFFFH

.286
    mov dx, 0
    mov ax, 5
    imul ax, -1     ; AX=0FFFBH, DX=0000H (DX에는 영향을 미치지 않는다.)

    ; 부호 없는 정수의 나눗셈
    mov ax, 8700h   ; AX=34560
    mov bl, 0c7h
    div bl          ; AH=85H, AL=0ADH

    ; 부호 있는 정수의 나눗셈
    mov ax, 779h
    mov bl, 87h
    idiv bl         ; AH=62, AL=F1

    mov ax, 4c00h
    int 21h
main endp
end main