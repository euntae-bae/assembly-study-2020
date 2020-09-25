.model small
.stack 100h
.data
wordVar1 dw 1234h   ; 34 12
wordVar2 dw 0000h   ; 00 00
arr1 db 0abh, 0cdh  ; AB CD

.code
main proc
    mov ax, @data
    mov ds, ax

    ; 레지스터 값 변화를 확인하기 위해 0으로 초기화
    mov ax, 0
    mov bx, 0
    mov cx, 0

    mov al, byte ptr wordVar1       ; AL=34h
    mov al, byte ptr wordVar1 + 1   ; AL=12h
    mov byte ptr wordVar2, 0ffh     ; 워드형 변수 wordVar2의 하위 바이트는 0ffh로 채워짐
    mov byte ptr wordVar2+1, 0aah   ; 워드형 변수 wordVar2의 상위 바이트는 0aah로 채워짐
    mov bx, wordVar2                ; BX=aaffh
    mov cx, word ptr arr1           ; CX= 0cdabh

    mov ax, 4c00h
    int 21h
main endp
end main