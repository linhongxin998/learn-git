data segment
num1 db 8,7,6,5
num1l db 4
num2 db 4,3,2,1
num11 db 8,7,6,5
num22 db 4,3,2,1
num111 db 8,7,6,5
num222 db 4,3,2,1
num2l db 4
var1 db ?
data ends
stack segment
dw 20h dup(0)
stack ends
code segment
assume ds:data,cs:code,ss:stack
start:
mov ax,data
mov ds,ax
call addfunction
call show
mov dl,0ah
mov ah,02h
int 21h
call subfunction
call show1
mov ah,4ch
int 21h
addfunction:
mov ch,0
mov si,offset num1
mov di,offset num2
mov ah,num1l
mov al,num2l
mov var1,ah
cmp ah,al
jae cha
xchg si,di
xchg ah,al
mov var1,ah
cha:
sub ah,al
mov cl,al
clc
lop1:
mov al,[di]
adc [si],al
inc si
inc di
loop lop1
mov cl,ah
jcxz s00
lop2:
adc byte ptr [si],0
inc si
loop lop2
s00:
ret
subfunction:
clc
mov ch,0
mov si,offset num11
mov di,offset num22
mov ah,num1l
mov al,num2l
cmp ah,al
jae cha1
xchg si,di
xchg ah,al
cha1:
sub ah,al
mov cl,al
clc
lop11:
mov al,[di]
sbb [si],al
inc si
inc di
loop lop11
mov cl,ah
jcxz s01
lop21:
adc byte ptr [si],0
inc si
loop lop21
s01:
ret
show:
xor cx,cx
mov cl,var1
dec si
add byte ptr[num111][3],30h
mov dl,[num111][3]
mov ah,02h
int 21h
add  byte ptr[num111][2],30h
mov dl,[num111][2]
mov ah,02h
int 21h
add  byte ptr[num111][1],30h
mov dl,[num111][1]
mov ah,02h
int 21h
add  byte ptr[num111][0],30h
mov dl,[num111][0]
mov ah,02h
int 21h
mov dl,'+'
mov ah,02h
int 21h
add  byte ptr[num222][3],30h
mov dl,[num222][3]
mov ah,02h
int 21h
add  byte ptr[num222][2],30h
mov dl,[num222][2]
mov ah,02h
int 21h
add  byte ptr[num222][1],30h
mov dl,[num222][1]
mov ah,02h
int 21h
add  byte ptr[num222][0],30h
mov dl,[num222][0]
mov ah,02h
int 21h
mov dl,'='
mov ah,02h
int 21h
s0:
cmp byte ptr[si],9
jbe s1
add byte ptr[si],7
s1:
add byte ptr[si],30h
mov dl,[si]
mov ah,02h
int 21h
dec si
loop s0
ret
show1:
xor cx,cx
mov cl,var1
dec si

mov dl,[num111][3]
mov ah,02h
int 21h

mov dl,[num111][2]
mov ah,02h
int 21h

mov dl,[num111][1]
mov ah,02h
int 21h

mov dl,[num111][0]
mov ah,02h
int 21h
mov dl,'-'
mov ah,02h
int 21h

mov dl,[num222][3]
mov ah,02h
int 21h

mov dl,[num222][2]
mov ah,02h
int 21h

mov dl,[num222][1]
mov ah,02h
int 21h

mov dl,[num222][0]
mov ah,02h
int 21h
mov dl,'='
mov ah,02h
int 21h
s000:
cmp byte ptr[si],9
jbe s111
add byte ptr[si],7
s111:
add byte ptr[si],30h
mov dl,[si]
mov ah,02h
int 21h
dec si
loop s000
ret
code ends
end start