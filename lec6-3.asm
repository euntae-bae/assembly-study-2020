.model small
.stack 100h
.data
byteVar1 db 10h
byteVar2 db 20h
wordVar1 dw 8086h
wordVar2 dw ?

byteArr db 12h, 34h, 56h, 78h, 9ah, 0bch
wordArr dw 1020h, 3040h, 8086h, 8088h

.code
main proc
    mov ax, @data
    mov ds, ax

    ; 즉시 값
    mov ax, 0
    mov bx, 0
    mov ax, 0ffffh
    mov al, 10h

    ; 레지스터
    mov bx, ax
    
    ; 직접 주소
    mov ax, 0
    mov ax, wordVar1    ; AX=8086h
    mov al, byteVar1    ; AX=8010h
    mov wordVar2, ax

    ; 변위가 추가된 직접 주소
    mov ax, 0
    mov al, byteArr+2   ; AL=56h
    mov al, byteArr[3]  ; AL=78h, byteArr+3 과 동일
    mov ax, wordArr     ; AX=1020h
    mov ax, wordArr+2   ; AX=3040h
    mov ax, wordArr+4   ; AX=8086h

    ; 간접 주소, 간접 주소에 변위가 추가되는 경우
    mov ax, 0
    lea bx, byteArr     ; BX에 byteArr의 오프셋 주소를 적재
    mov al, [bx]        ; AL=12h
    mov al, [bx+1]      ; AL=34h
    mov al, [bx+2]      ; AL=56h

    mov bx, offset wordArr
    mov ax, [bx]        ; AX=1020h
    mov ax, [bx+2]      ; AX=3040h
    mov ax, [bx+4]      ; AX=8086h

    ; 인덱스 주소
    mov ax, 0
    mov bx, 0
    mov si, 0
    mov al, [byteArr+si]    ; AL=12h
    inc si                  ; SI의 값 1 증가
    mov al, [si+byteArr]    ; AL=34h
    inc si
    mov al, byteArr[si]     ; AL=56h
    
    inc si
    lea bx, byteArr
    mov al, [bx+si]         ; AL=78h
    mov al, [bx+si+1]       ; AL=9ah
    mov al, [bx+si+2]       ; AL=0bch
    mov al, [bx+si-1]       ; AL=56h
    mov al, [bx+si-2]       ; AL=34h

    mov ax, 4c00h
    int 21h
main endp
end main