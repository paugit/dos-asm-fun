int_sqrt:
	push bx
	push cx
	push dx

	mov cx, ax
	mov dx, 2
	
	push cx
	mov bx, cx
	mov cl, dl
	shr bx, cl
	pop cx

	.first_loop:

	cmp bx, 0
	je .continue

	cmp bx, cx
	je .continue

	inc dx
	inc dx

	push cx
	mov bx, cx
	mov cl, dl
	shr bx, cl
	pop cx
	
	jmp .first_loop

	.continue:

	dec dx
	dec dx

	mov ax, 0

	.second_loop:
	cmp dx, 0
	jl .end

	shl ax, 1
	mov bx, ax
	inc bx

	push ax
	push cx
	push dx

	mov ax, cx
	mov cl, dl
	shr ax, cl
	mov cx, ax

	mov ax, bx
	mul bx

	cmp ax, cx

	pop dx
	pop cx
	pop ax
	
	ja .skip

	mov ax, bx

	.skip:

	dec dx
	dec dx

	jmp .second_loop

	.end:
	pop dx
	pop cx
	pop bx
ret
