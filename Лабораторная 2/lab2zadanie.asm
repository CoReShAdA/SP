global _start

section .data
massiv1 dw 0x45, 0x4000, 0xF, 0x1, 0x2, 0x9, 0x1, 0x7, 0x123, 0xA


section .bss
massiv2 resw 10

section .text
_start:
mov ecx, 10
mov esi, massiv1
mov edi, massiv2
xor eax, eax

loop1:
lodsw
not ah
stosw
loop loop1
mov ecx, 10
mov esi, massiv2
xor ebx, ebx

loop2:
lodsw
test eax, 1
jnp nechet
add ebx, eax

nechet:
cmp ecx, 0
je exit
loop loop2

exit:
mov eax, 1
mov ebx, 0
int 0x80
