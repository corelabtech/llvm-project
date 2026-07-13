# With P extension:
# RUN: llvm-mc -triple=riscv32 -show-encoding -print-imm-hex --mattr=+experimental-p %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INST
# RUN: not llvm-mc -triple=riscv32 -show-encoding %s 2>&1 \
# RUN:        | FileCheck %s --check-prefix=CHECK-ERROR
# RUN: llvm-mc -triple=riscv32 -filetype=obj --mattr=+experimental-p %s \
# RUN:        | llvm-objdump -d --mattr=+experimental-p - \
# RUN:        | FileCheck %s --check-prefix=CHECK-INST
# RUN: llvm-mc -triple=riscv32 -filetype=obj --mattr=+experimental-p %s \
# RUN:        | llvm-objdump -d - | FileCheck %s --check-prefix=CHECK-UNKNOWN

# RUN: llvm-mc -triple=riscv64 -show-encoding -print-imm-hex --mattr=+experimental-p %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INST
# RUN: not llvm-mc -triple=riscv64 -show-encoding %s 2>&1 \
# RUN:        | FileCheck %s --check-prefix=CHECK-ERROR
# RUN: llvm-mc -triple=riscv64 -filetype=obj --mattr=+experimental-p %s \
# RUN:        | llvm-objdump -d --mattr=+experimental-p - \
# RUN:        | FileCheck %s --check-prefix=CHECK-INST
# RUN: llvm-mc -triple=riscv64 -filetype=obj --mattr=+experimental-p %s \
# RUN:        | llvm-objdump -d - | FileCheck %s --check-prefix=CHECK-UNKNOWN

# With Zpn extension:
# RUN: llvm-mc -triple=riscv32 -show-encoding -print-imm-hex --mattr=+experimental-zpn %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INST
# RUN: not llvm-mc -triple=riscv32 -show-encoding %s 2>&1 \
# RUN:        | FileCheck %s --check-prefix=CHECK-ERROR
# RUN: llvm-mc -triple=riscv32 -filetype=obj --mattr=+experimental-zpn %s \
# RUN:        | llvm-objdump -d --mattr=+experimental-zpn - \
# RUN:        | FileCheck %s --check-prefix=CHECK-INST
# RUN: llvm-mc -triple=riscv32 -filetype=obj --mattr=+experimental-zpn %s \
# RUN:        | llvm-objdump -d - | FileCheck %s --check-prefix=CHECK-UNKNOWN

# RUN: llvm-mc -triple=riscv64 -show-encoding -print-imm-hex --mattr=+experimental-zpn %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INST
# RUN: not llvm-mc -triple=riscv64 -show-encoding %s 2>&1 \
# RUN:        | FileCheck %s --check-prefix=CHECK-ERROR
# RUN: llvm-mc -triple=riscv64 -filetype=obj --mattr=+experimental-zpn %s \
# RUN:        | llvm-objdump -d --mattr=+experimental-zpn - \
# RUN:        | FileCheck %s --check-prefix=CHECK-INST
# RUN: llvm-mc -triple=riscv64 -filetype=obj --mattr=+experimental-zpn %s \
# RUN:        | llvm-objdump -d - | FileCheck %s --check-prefix=CHECK-UNKNOWN

# SIMD 16-bit Shift

# CHECK-INST: sra16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x50]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 50c58577 <unknown>
sra16 a0, a1, a2

# CHECK-INST: srai16 a0, a1, 0x3
# CHECK-ENCODING: [0x77,0x85,0x35,0x70]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 70358577 <unknown>
srai16 a0, a1, 3

# CHECK-INST: sra16.u a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x60]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 60c58577 <unknown>
sra16.u a0, a1, a2

# CHECK-INST: srai16.u a0, a1, 0x4
# CHECK-ENCODING: [0x77,0x85,0x45,0x71]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 71458577 <unknown>
srai16.u a0, a1, 4

# CHECK-INST: srl16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x52]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 52c58577 <unknown>
srl16 a0, a1, a2

# CHECK-INST: srli16 a0, a1, 0x9
# CHECK-ENCODING: [0x77,0x85,0x95,0x72]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 72958577 <unknown>
srli16 a0, a1, 9

# CHECK-INST: srl16.u a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x62]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 62c58577 <unknown>
srl16.u a0, a1, a2

# CHECK-INST: srli16.u a0, a1, 0xa
# CHECK-ENCODING: [0x77,0x85,0xa5,0x73]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 73a58577 <unknown>
srli16.u a0, a1, 10

# CHECK-INST: sll16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x54]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 54c58577 <unknown>
sll16 a0, a1, a2

# CHECK-INST: slli16 a0, a1, 0x8
# CHECK-ENCODING: [0x77,0x85,0x85,0x74]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 74858577 <unknown>
slli16 a0, a1, 8

# CHECK-INST: ksll16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x64]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 64c58577 <unknown>
ksll16 a0, a1, a2

# CHECK-INST: kslli16 a0, a1, 0x5
# CHECK-ENCODING: [0x77,0x85,0x55,0x75]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 75558577 <unknown>
kslli16 a0, a1, 5

# CHECK-INST: kslra16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x56]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 56c58577 <unknown>
kslra16 a0, a1, a2

# CHECK-INST: kslra16.u a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x66]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 66c58577 <unknown>
kslra16.u a0, a1, a2

# SIMD 8-bit Shift

# CHECK-INST: sra8 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x58]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 58c58577 <unknown>
sra8 a0, a1, a2

# CHECK-INST: srai8 a0, a1, 0x1
# CHECK-ENCODING: [0x77,0x85,0x15,0x78]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 78158577 <unknown>
srai8 a0, a1, 1

# CHECK-INST: sra8.u a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x68]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 68c58577 <unknown>
sra8.u a0, a1, a2

# CHECK-INST: srai8.u a0, a1, 0x2
# CHECK-ENCODING: [0x77,0x85,0xa5,0x78]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 78a58577 <unknown>
srai8.u a0, a1, 2

# CHECK-INST: srl8 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x5a]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 5ac58577 <unknown>
srl8 a0, a1, a2

# CHECK-INST: srli8 a0, a1, 0x3
# CHECK-ENCODING: [0x77,0x85,0x35,0x7a]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 7a358577 <unknown>
srli8 a0, a1, 3

# CHECK-INST: srl8.u a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x6a]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 6ac58577 <unknown>
srl8.u a0, a1, a2

# CHECK-INST: srli8.u a0, a1, 0x4
# CHECK-ENCODING: [0x77,0x85,0xc5,0x7a]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 7ac58577 <unknown>
srli8.u a0, a1, 4

# CHECK-INST: sll8 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x5c]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 5cc58577 <unknown>
sll8 a0, a1, a2

# CHECK-INST: slli8 a0, a1, 0x1
# CHECK-ENCODING: [0x77,0x85,0x15,0x7c]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 7c158577 <unknown>
slli8 a0, a1, 1

# CHECK-INST: ksll8 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x6c]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 6cc58577 <unknown>
ksll8 a0, a1, a2

# CHECK-INST: kslli8 a0, a1, 0x6
# CHECK-ENCODING: [0x77,0x85,0xe5,0x7c]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 7ce58577 <unknown>
kslli8 a0, a1, 6

# CHECK-INST: kslra8 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x5e]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 5ec58577 <unknown>
kslra8 a0, a1, a2

# CHECK-INST: kslra8.u a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x6e]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 6ec58577 <unknown>
kslra8.u a0, a1, a2
