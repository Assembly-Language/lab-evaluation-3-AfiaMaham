

INCLUDE Irvine32.inc
.data
;public asmfunc
msg db "assembly procedure end now",0


.code
asmfunc PROC p1:PTR DWORD, p2:DWORD, p3: PTR DWORD
    
    mov esi, [esp + 8]        ; pass address of array in esi
    mov ecx, [esp + 12]       ; pass length of array in ecx
    mov edi, [esp + 16]       ; pass address of sum variable in edi
    mov eax, [edi]            ; dereference the edi (having sum variable address) and value is passed in eax (currently 0)
    L1:
    test DWORD PTR [esi], 1h       ; perform AND operation between array element and 1h without affecting destination
    jz add_even                  ; jump to add_even label if zero flag is set.
    jnz cont               ; jump to cont label if zero flag is not set.

    add_even:                ; add_even label
    add eax, [esi]           ; add each even to eax
    mov [edi], eax          ; passes sum to the edi 

    cont:              ; cont label
    add esi, 4          ; add 4 to esi
    loop L1          ; subtract 1 from ecx checks if equal to zero or not. if not zero move to L1 otherwise terminates the loop.

    
    
    mov edx, offset msg       ; print message
    call writestring
    call crlf
    
    ret
asmfunc ENDP
end