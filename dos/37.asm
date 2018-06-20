;这个是实验三的第二个实验
;十进制数 X 转 M 进制，方法是：从 X 开始循环除以 M ，记下余数，整数商作为新的 X 继续除以 M ，直到 X=0 为止。然后倒序取余数即可。
data segment
var1 dw 0;储存十进制数
var2 dw 0;储存进制
var3 dw 100h dup(?);储存余数
data ends
code segment
assume ds:data,cs:code
start:
mov ax,data
mov ds,ax
mov dx,0
mov cx,1000
mov si,0
s1:
mov ah,1
int 21h
cmp al,0dh
je s2
and al,0fh
shl var1,1
mov bx,var1
shl var1,1
shl var1,1
add var1,bx
mov ah,0
add var1,ax
loop s1
s2:
mov ah,1
int 21h
cmp al,0dh
je s3
and al,0fh
shl var2,1
mov bx,var2
shl var2,1
shl var2,1
add var2,bx
mov ah,0
add var2,ax
loop s2
s3:
mov ax,var1
div word ptr var2
mov [var3][si],dx;存余数
mov var1,ax;存商
inc si
cmp al,0
jne s3
dec si
show:
add word ptr[var3][si],30h
mov dx,[var3][si]
mov ah,02
int 21h
dec si
cmp si,0ffffh
je s4
cmp si,0
jae show
s4:
mov ah,4ch
int 21h
code ends
end start