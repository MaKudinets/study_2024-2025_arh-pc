%include 'in_out.asm'
section .data
msg1 db "Наименьшее число: ",0h
A dd 41  
B dd 62 
C dd 35 
section .bss
min resd 1 
section .text
global _start
_start:
; ---------- Записываем 'A' в переменную 'min'
mov eax, [A] 
mov [min], eax 

; ---------- Сравниваем 'A' и 'С' (как числа)
cmp eax, [C] 
jl check_B 
mov eax, [C] 
mov [min], eax

; ---------- Сравниваем 'min(A,C)' и 'B' (как числа)
check_B:
cmp eax, [B] 
jl fin 
mov eax, [B] 
mov [min], eax 

; ---------- Вывод результата
fin:
mov eax, msg1
call sprint 
mov eax, [min] 
call iprintLF 
call quit 
