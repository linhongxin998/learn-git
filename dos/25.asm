data segment;;实验2的第一个程序
var1 db 1,2,3,4,5,6,7,8,9
var2 db '*'
var3 db '='
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov si,0
mov cx,9
s0:
mov bx,[si];用cx来表示被乘数，用bx来表示乘数
;用cmp来判断bx与cx的大小，如果bx不等于cx，就要跳转至s1,增加cx(这个是一行的)
;如果是一列，就要跳转至s0
push cx
mov cx,0
s1:
inc cx
push bx
push cx
add cx,30h
mov dl,cl
mov ah,2
int 21h
mov dl,var2
mov ah,2
int 21h
add bx,30h
mov dl,bl
mov ah,2
int 21h
mov dl,var3
mov ah,2
int 21h
pop cx
pop bx
push cx
push bx
mov al,cl
mul bl
push ax
mov ah,0
mov dh,10
div dh
add al,30h
mov dl,al
mov ah,2
int 21h
pop ax
mov dh,10
div dh
add ah,30h
mov dl,ah
mov ah,2
int 21h
mov dl,20h
mov ah,2
int 21h
pop bx
pop cx
cmp cl,bl
jne s1
mov dl,0ah
mov ah,2
int 21h
pop cx
inc si
loop s0;输出九行
mov ah,4ch
int 21h
code ends
end start
