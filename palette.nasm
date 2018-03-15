org 100h ; offset for com

section .text

start:

; gfx mode
mov al, 13h
int 10h

; screen ptr
mov ax, 0a000h
mov es, ax

; clear screen
xor di, di ; offset
mov ax, 0 ; color
mov cx, 320*200/2 ; num repeats
rep stosw

; draw palette
xor cx, cx ; y

.next_row:
xor bx, bx ; x

.next_color:
mov dx, 320
mov ax, cx
mul dx
add ax, bx
mov di, ax

mov byte [es:di], bl

inc bx

cmp bx, 256
jl .next_color

inc cx
cmp cx, 200
jl .next_row

; wait for any key
xor ah, ah
int 16h

; text mode
mov ax, 0003h
int 10h

ret
