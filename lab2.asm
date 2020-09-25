.model small
.stack 100h
.data
byteVar1 db 10h
byteVar2 db 0ffh
wordVar1 dw 1234h
wordVar2 dw 0abcdh
byteArr1 db 12h, 34h, 56h, 78h
byteArr2 db 0abh, 0cdh, 0efh
wordArr1 dw 1234h, 5678h, 0abcdh, 0ef56h
sregData1 dw ?
sregData2 dw 1234h

.code
main proc
    ; DS 레지스터 초기화
    mov ax, @data
    mov ds, ax

    ; 레지스터에 메모리 데이터 전송 (직접 주소지정방식)
    mov al, byteVar1
    mov ah, byteVar2

    ; 레지스터 간 데이터 전송
    mov bx, ax
    mov cl, bh

    ; 레지스터와 세그먼트 레지스터 간 데이터 전송
    mov ds, ax
    mov bx, es

    ; 세그먼트 레지스터와 메모리 간 데이터 전송
    mov sregData1, ds
    mov es, sregData2

    ; 프로세스 종료
    mov ah, 4ch
    int 21h
main endp
end main