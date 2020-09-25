.model small
.stack 100h
.data
byte1 db 12h
byte2 db 34h

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ax, 0abcdh
    xchg ah, byte1
    xchg al, byte2
    ; AX=1234h

    mov ax, 4c00h
    int 21h
main endp
end main