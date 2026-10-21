# Indirect Syscalls

This repository is a small Windows x64 research demonstration of calling selected NT system services through assembly wrappers. It is intended for controlled, isolated lab analysis—not as a general-purpose library or production software.

## Overview

The program in `main.c` obtains the addresses of three NT exports from `ntdll.dll` and initializes the targets used by the assembly wrappers. It then allocates memory in its own process, copies an embedded byte buffer into that memory, and starts a thread at the buffer's address.

The wrappers in `syscalls.asm` cover:

- `NtAllocateVirtualMemory`
- `NtWriteVirtualMemory`
- `NtCreateThreadEx`

The implementation uses fixed syscall identifiers and assumes particular details about the layout of `ntdll.dll`. These assumptions can vary between Windows versions and builds, so this code is fragile and is not a supported Windows API technique.

## Requirements

- Windows x64
- The Microsoft C/C++ toolchain and Microsoft Macro Assembler (MASM)

No project or build-system files are included. Build configuration must account for both the C source and the x64 assembly source.

## Safety

The embedded byte buffer is executed as code. Treat the program as potentially unsafe: do not run it on a production machine, with sensitive data, or outside an isolated environment you control. Inspect the buffer and understand its behavior before any analysis.

This repository is provided for educational and defensive research. It is not a recommendation to bypass security controls, and indirect system calls are not a guarantee of stealth or successful execution.

## Limitations

- The implementation is specific to Windows x64.
- Fixed syscall identifiers and assumptions about `ntdll.dll` make it version-dependent.
- The example is not hardened for production use; callers should check and handle the status of each system call and clean up resources appropriately.
