code segment;实验三第3个程序
assume cs:code
start:
mov cx,10000
s0:
mov ah,01h
int 21h
cmp al,0dh
je s1
mov ah,0
push ax
inc si
loop s0
s1:
pop ax
dec si
cmp ax,20h
je s3
mov dl,al
mov ah,02h
int 21h
s3:
cmp si,0
je s4
loop s1
s4:
mov ah,4ch
int 21h
code ends
end start