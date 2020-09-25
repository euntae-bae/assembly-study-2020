.model small
.stack 100h
.data

.code
main proc
    ; 데이터 세그먼트 레지스터 초기화
    mov ax, @data
    mov ds, ax

    ; 프로그램 종료
    mov ah, 4ch
    int 21h
main endp
end main