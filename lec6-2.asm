.model small
.stack 100h
.data
byte1 db 25h    ; 양수
byte2 db 0f0h   ; 음수

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ax, 0
    mov bx, 0
.386
    movzx ax, byte1 ; AX=0025h
    movzx bx, byte2 ; BX=00f0h
    movsx ax, byte1 ; AX=0025h
    movsx bx, byte2 ; BX=fff0h

    mov ax, 4c00h
    int 21h
main endp
end main