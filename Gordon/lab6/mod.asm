.MODEL FLAT, C
.CODE
func PROC C NumRanDat:dword, arr:dword, LGrInt:dword, ans:dword

	mov ecx,0 			;������� ��� ������� �� �������
	mov ebx,arr 
	mov esi,LGrInt 
	mov edi,ans

main:
	mov edx,[ebx] 		;����� ������� �������� �������
	push ebx 			; ��������� ��������� �� ������� �������
	sub ebx,ebx 		; �������� ���������

compare:
	mov eax,ebx 		; eax �������� ������� ������ ������� ������
	shl eax,2 			; j >> 2
	cmp edx,[esi+eax] 	; ���������� arr[i] (edx �������� �� �����������) � LGrInt[j] (esi -> LGrInt, eax = j)
	jle append				; arr[i] <= LGrInt[j]
	inc ebx				; arr[i] > LGrInt[j] => i++
	jmp compare			; ��������� arr[i]

append:
	add eax,edi 		;edi -> ans => eax -> ans
	mov edx,[eax]		
	inc edx				
	mov [eax],edx		 
	pop ebx 			;�������� ������� ������� � ��������� �� �����
	add ebx,4
	inc ecx 			;i++
	cmp ecx, NumRanDat	
	jl main				;i < NumRanDat

ret
func ENDP

END