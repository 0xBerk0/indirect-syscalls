.CODE

EXTERN sysAddrNtAllocateVirtualMemory:QWORD
EXTERN sysAddrNtWriteVirtualMemory:QWORD
EXTERN sysAddrNtCreateThreadEx:QWORD

SysNtAllocateVirtualMemory PROC
    mov r10, rcx
    mov eax, 18h
    jmp QWORD PTR [sysAddrNtAllocateVirtualMemory]
SysNtAllocateVirtualMemory ENDP

SysNtWriteVirtualMemory PROC
    mov r10, rcx
    mov eax, 3Ah
    jmp QWORD PTR [sysAddrNtWriteVirtualMemory]
SysNtWriteVirtualMemory ENDP

SysNtCreateThreadEx PROC
    mov r10, rcx
    mov eax, 0C9h
    jmp QWORD PTR [sysAddrNtCreateThreadEx]
SysNtCreateThreadEx ENDP

END