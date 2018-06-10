data segment;;输出时千万千万不能犯我刚刚的错误了，一定要除1000，得到商，余数不可能一下子输出，应该把余数在除以100，得到商，再输出，以此循环
var1 dw ?;;注意注意：一个程序里只允许有一个函数;;应该是堆栈调用的问题
var2 dw ?
result dw ?
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov ah,01h
int 21h
xor ah,ah
and al,0fh;;因为输入的是ASCII码，将其转变为数字
mov var1,al  ;0号地址保存x
mov ax,0
mov ah,01h
int 21h
xor ah,ah
and al,0fh
mov var2,al  ;1号地址保存n
mov ax,0
mov word ptr result,1
mov dx,0
call function  
push ax
mov dx,0
mov cx,1000
div cx
push ax
push dx
add al,30h
mov dl,al
mov ah,2
int 21h
pop dx
push dx
mov ax,dx
mov cx,100
div cl
push ax
add al,30h
mov dl,al
mov ah,2
int 21h
pop ax
mov al,ah
mov ah,0
mov cx,10
div cl
push ax
add al,30h
mov dl,al
mov ah,2
int 21h
pop ax
add ah,30h
mov dl,ah
mov ah,2
int 21h
mov ax,4c00h
int 21h
s:
dec byte ptr var2
function:
mov al,result
mul word ptr var1
mov result,ax
cmp word ptr var2,1
jne s
ret
code ends
end start
