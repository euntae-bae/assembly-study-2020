.model small
.stack 100h
.data
; 기능 코드 9h번으로 지정되는 문자열 출력 루틴은 문자열의 마지막을 나타내기 위해 $ 기호를 넣어줄 것을 지시하고 있다.
stdInfo db '12345678 Nyang Cat', '$'

.code
main proc
    ; DS 레지스터에 데이터 세그먼트의 시작주소를 초기화한다.
    mov ax, @data
    mov ds, ax

    lea dx, stdInfo ; 문자열의 시작 주소를 DX 레지스터에 적재
    mov ah, 9h      ; 기능 코드(function) 9는 문자열 출력을 나타낸다.
    int 21h

    ; 프로그램 종료
    mov ax, 4c00h
    int 21h
main endp

end main