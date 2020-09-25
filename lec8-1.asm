.model small
.stack 100h
.data
byteArr DB 1, 2, 3, 4, 5, 6, 7
sum DB 0

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ax, 0
    mov si, 0
    add al, [byteArr+si]    ; AL=1 (1H)
    inc si
    add al, [byteArr+si]    ; AL=3 (3H)
    inc si
    add al, [byteArr+si]    ; AL=6 (6H)
    inc si
    add al, byteArr[si]     ; AL=10 (0AH)
    inc si
    add al, byteArr[si]     ; AL=15 (0FH)
    inc si
    add al, byteArr[si]     ; AL=21 (15H)
    inc si
    add al, [byteArr+si]    ; AL=28 (1CH)

    mov sum, al
    dec al                  ; AL=27 (1BH)
    neg al                  ; AL=-27 (0E5H)

    mov ax, 4c00h
    int 21h
main endp
end main