;这个是实验三的第二个实验
;十进制数 X 转 M 进制，方法是：从 X 开始循环除以 M ，记下余数，整数商作为新的 X 继续除以 M ，直到 X=0 为止。然后倒序取余数即可。
data segment
var1 db ?;储存十进制数
var2 db ?;储存进制
var3 db 100h dup(?);储存余数
data ends
code segment
assume ds:data,cs:code
start:
mov ax,data
mov ds,ax
mov cx,10000
mov di,0
shijinzhi:
mov ah,01
int 21h
cmp al,0dh
je mjingzhi
cmp di,1
je s11
cmp di,2
je s111
xor ah,ah
and al,0fh
mov dl,100
mul dl
mov var1,al
inc di
s00:
loop shijinzhi
s11:
xor ah,ah
and al,0fh
mov dl,10
mul dl
add var1,al
inc di
jmp s00

s111:
xor ah,ah
and al,0fh
add var1,al
inc di
jmp s00
mjingzhi:
mov ah,01
int 21h
cmp al,0dh
je s0
xor ah,ah
and al,0fh
mov var2,al
mov si,0
loop mjingzhi
s0:
mov ax,0
mov al,var1
div byte ptr var2
mov [var3][si],ah;存余数
mov var1,al;存商
inc si
cmp al,0
jne s0
dec si
show:
add byte ptr[var3][si],30h
mov dl,[var3][si]
mov ah,02
int 21h
dec si
cmp si,0ffffh
je s1
cmp si,0
jae show
s1:
mov ah,4ch
int 21h
code ends
end start