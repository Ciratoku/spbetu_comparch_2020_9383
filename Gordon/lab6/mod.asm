.686
.MODEL FLAT, C
.STACK
.DATA
.CODE
func PROC C NumRanDat:dword, arr:dword, LGrInt:dword, ans:dword, NInt:dword

	mov ecx, 0					;������� ��� ������� �� LGrInt
	mov eax, [arr] 
	mov esi, [LGrInt] 
	mov edi, [ans] 

outerLoop:

    cmp ecx, NInt				;i < NInt
    je done
    mov ebx, 0					;j

innerLoop:
	push ebx
	shl ebx, 2
    mov edx, [eax + ebx]		;arr[i] -> edx
	pop ebx
	push ecx
	shl ecx, 2

	push eax
	mov eax, [esi + ecx]
	cmp edx, eax				;���������� arr[i] � LGrInt[j]

	pop eax

	pop ecx
leftborder:
	jl next						;���� arr[i] < LGrInt[j], �� ���� �������
rightborder:
	push ecx
	shl ecx, 2
	cmp edx, [esi + ecx + 4]	;arr[i] >= LGrInt[j], ���������� � LGrInt[j+1]
	pop ecx
	jg next						;���� arr[i] > LGrInt[j+1], �� ���� �������
	push ecx
	shl ecx, 2
	push eax
	mov eax, [edi + ecx]
	add eax, 1					;����� ans[j]++
	mov [edi + ecx], eax
	pop eax
	pop ecx
next:
	inc ebx
    cmp ebx, NumRanDat
    je innerLoopDone
    jmp innerLoop

innerLoopDone:

    inc ecx
    jmp outerLoop

done:
	ret
func ENDP

END 