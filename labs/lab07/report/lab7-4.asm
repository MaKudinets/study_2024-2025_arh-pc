%include 'in_out.asm'
section .data
msg1 db 'Введите x: ', 0h
msg2 db 'Введите a: ', 0h
msg3 db 'Результат: ', 0h
section .bss
x resd 1
a resd 1
res resd 1
section .text
global _start
_start:
    ; ---------- Вывод сообщения 'Введите x: '
mov eax, msg1
call sprint
    
    ; ---------- Ввод 'x'
mov ecx, x
mov edx, 11
call sread
    ; ---------- Преобразование 'x' из символа в число
mov eax, x
call atoi
mov [x], eax
    ; ---------- Вывод сообщения 'Введите a: '
mov eax, msg2
call sprint
    ; ---------- Ввод 'a'
mov ecx, a
mov edx, 11
call sread
    ; ---------- Преобразование 'a' из символа в число
mov eax, a
call atoi
mov [a], eax
    ; ---------- Сравниваем 'x' и '2'
mov eax, [x]  		; Загружаем значение 'x' в EAX
cmp eax, 2    		; Сравниваем EAX с 2
jg do_first  		; если 'x>2', то переход на метку 'do_first',
jle do_second 		; иначе переход на метку 'do_second'

do_first:
    mov eax, [x]  	; Загружаем значение 'x' в EAX
    sub eax, 2       	; Вычитаем 2 из EAX
    mov [res], eax  	; Переносим результат в ECX
    jmp fin

do_second:
    mov eax, [a]  	; Загружаем значение 'a' в EAX
    mov edx, 0
    mul dword [a]	; Умножаем EAX на 3
    mov [res], eax  	; Переносим результат в ECX
    jmp fin

    ; ---------- Вывод результата
fin:
    mov eax, msg3
    call sprint  	; Вывод сообщения 'Результат: '
    mov eax, [res]	; Переносим результат из ECX в EAX
    call iprintLF  	; Вывод 'x'
    call quit     	; Выход
