# With P extension:
# RUN: llvm-mc -triple=riscv32 -show-encoding --mattr=+experimental-p %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INST
# RUN: not llvm-mc -triple=riscv32 -show-encoding %s 2>&1 \
# RUN:        | FileCheck %s --check-prefix=CHECK-ERROR
# RUN: llvm-mc -triple=riscv32 -filetype=obj --mattr=+experimental-p %s \
# RUN:        | llvm-objdump -d --mattr=+experimental-p - \
# RUN:        | FileCheck %s --check-prefix=CHECK-INST
# RUN: llvm-mc -triple=riscv32 -filetype=obj --mattr=+experimental-p %s \
# RUN:        | llvm-objdump -d - | FileCheck %s --check-prefix=CHECK-UNKNOWN

# RUN: llvm-mc -triple=riscv64 -show-encoding --mattr=+experimental-p %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INST
# RUN: not llvm-mc -triple=riscv64 -show-encoding %s 2>&1 \
# RUN:        | FileCheck %s --check-prefix=CHECK-ERROR
# RUN: llvm-mc -triple=riscv64 -filetype=obj --mattr=+experimental-p %s \
# RUN:        | llvm-objdump -d --mattr=+experimental-p - \
# RUN:        | FileCheck %s --check-prefix=CHECK-INST
# RUN: llvm-mc -triple=riscv64 -filetype=obj --mattr=+experimental-p %s \
# RUN:        | llvm-objdump -d - | FileCheck %s --check-prefix=CHECK-UNKNOWN

# With Zpn extension:
# RUN: llvm-mc -triple=riscv32 -show-encoding --mattr=+experimental-zpn %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INST
# RUN: not llvm-mc -triple=riscv32 -show-encoding %s 2>&1 \
# RUN:        | FileCheck %s --check-prefix=CHECK-ERROR
# RUN: llvm-mc -triple=riscv32 -filetype=obj --mattr=+experimental-zpn %s \
# RUN:        | llvm-objdump -d --mattr=+experimental-zpn - \
# RUN:        | FileCheck %s --check-prefix=CHECK-INST
# RUN: llvm-mc -triple=riscv32 -filetype=obj --mattr=+experimental-zpn %s \
# RUN:        | llvm-objdump -d - | FileCheck %s --check-prefix=CHECK-UNKNOWN

# RUN: llvm-mc -triple=riscv64 -show-encoding --mattr=+experimental-zpn %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INST
# RUN: not llvm-mc -triple=riscv64 -show-encoding %s 2>&1 \
# RUN:        | FileCheck %s --check-prefix=CHECK-ERROR
# RUN: llvm-mc -triple=riscv64 -filetype=obj --mattr=+experimental-zpn %s \
# RUN:        | llvm-objdump -d --mattr=+experimental-zpn - \
# RUN:        | FileCheck %s --check-prefix=CHECK-INST
# RUN: llvm-mc -triple=riscv64 -filetype=obj --mattr=+experimental-zpn %s \
# RUN:        | llvm-objdump -d - | FileCheck %s --check-prefix=CHECK-UNKNOWN

# 8-bit Unpacking

# CHECK-INST: sunpkd810 a0, a1
# CHECK-ENCODING: [0x77,0x85,0x85,0xac]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: ac858577 <unknown>
sunpkd810 a0, a1

# CHECK-INST: sunpkd820 a0, a1
# CHECK-ENCODING: [0x77,0x85,0x95,0xac]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: ac958577 <unknown>
sunpkd820 a0, a1

# CHECK-INST: sunpkd830 a0, a1
# CHECK-ENCODING: [0x77,0x85,0xa5,0xac]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: aca58577 <unknown>
sunpkd830 a0, a1

# CHECK-INST: sunpkd831 a0, a1
# CHECK-ENCODING: [0x77,0x85,0xb5,0xac]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: acb58577 <unknown>
sunpkd831 a0, a1

# CHECK-INST: sunpkd832 a0, a1
# CHECK-ENCODING: [0x77,0x85,0x35,0xad]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: ad358577 <unknown>
sunpkd832 a0, a1

# CHECK-INST: zunpkd810 a0, a1
# CHECK-ENCODING: [0x77,0x85,0xc5,0xac]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: acc58577 <unknown>
zunpkd810 a0, a1

# CHECK-INST: zunpkd820 a0, a1
# CHECK-ENCODING: [0x77,0x85,0xd5,0xac]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: acd58577 <unknown>
zunpkd820 a0, a1

# CHECK-INST: zunpkd830 a0, a1
# CHECK-ENCODING: [0x77,0x85,0xe5,0xac]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: ace58577 <unknown>
zunpkd830 a0, a1

# CHECK-INST: zunpkd831 a0, a1
# CHECK-ENCODING: [0x77,0x85,0xf5,0xac]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: acf58577 <unknown>
zunpkd831 a0, a1

# CHECK-INST: zunpkd832 a0, a1
# CHECK-ENCODING: [0x77,0x85,0x75,0xad]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: ad758577 <unknown>
zunpkd832 a0, a1
