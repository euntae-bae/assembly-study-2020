.model small
.stack 100h
.data
str1 db 'Hello world', 0dh, 0ah, '$'

.code
main proc far
    mov ax, @data
    mov ds, ax
    call nearPrint  ; 근거리 호출: 복귀 주소를 스택에 푸시하고, 프로시저의 위치로 제어를 넘긴다.
    call farPrint   ; 원거리 호출: 근거리 호출과 다르게 복귀 주소뿐 아니라, CS의 값을 스택에 푸시한다.
    mov ax, 4c00h
    int 21h
main endp

nearPrint proc near
    push ax
    lea dx, str1
    mov ah, 9h
    int 21h
    pop ax
    ret ;   RETN
nearPrint endp

farPrint proc far
    push ax
    lea dx, str1
    mov ah, 9h
    int 21h
    pop ax
    ret ;   RETF
farPrint endp

end main