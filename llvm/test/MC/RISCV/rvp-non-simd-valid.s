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

# Non-SIMD Q15 saturation ALU

# CHECK-INST: kaddh a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x04]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 04c59577 <unknown>
kaddh a0, a1, a2

# CHECK-INST: ksubh a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x06]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 06c59577 <unknown>
ksubh a0, a1, a2

# CHECK-INST: khmbb a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x0c]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 0cc59577 <unknown>
khmbb a0, a1, a2

# CHECK-INST: khmbt a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x1c]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 1cc59577 <unknown>
khmbt a0, a1, a2

# CHECK-INST: khmtt a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x2c]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 2cc59577 <unknown>
khmtt a0, a1, a2

# CHECK-INST: ukaddh a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x14]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 14c59577 <unknown>
ukaddh a0, a1, a2

# CHECK-INST: uksubh a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x16]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 16c59577 <unknown>
uksubh a0, a1, a2

# Non-SIMD Q31 saturation ALU

# CHECK-INST: kaddw a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x00]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 00c59577 <unknown>
kaddw a0, a1, a2

# CHECK-INST: ukaddw a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x10]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 10c59577 <unknown>
ukaddw a0, a1, a2

# CHECK-INST: ksubw a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x02]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 02c59577 <unknown>
ksubw a0, a1, a2

# CHECK-INST: uksubw a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x12]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 12c59577 <unknown>
uksubw a0, a1, a2

# CHECK-INST: kdmbb a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x0a]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 0ac59577 <unknown>
kdmbb a0, a1, a2

# CHECK-INST: kdmbt a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x1a]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 1ac59577 <unknown>
kdmbt a0, a1, a2

# CHECK-INST: kdmtt a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x2a]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 2ac59577 <unknown>
kdmtt a0, a1, a2

# CHECK-INST: kslraw a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x6e]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 6ec59577 <unknown>
kslraw a0, a1, a2

# CHECK-INST: kslraw.u a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x7e]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 7ec59577 <unknown>
kslraw.u a0, a1, a2

# CHECK-INST: ksllw a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x26]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 26c59577 <unknown>
ksllw a0, a1, a2

# CHECK-INST: kslliw a0, a1, 0x1f
# CHECK-ENCODING: [0x77,0x95,0xf5,0x37]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 37f59577 <unknown>
kslliw a0, a1, 31

# CHECK-INST: kdmabb a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0xd2]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: d2c59577 <unknown>
kdmabb a0, a1, a2

# CHECK-INST: kdmabt a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0xe2]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: e2c59577 <unknown>
kdmabt a0, a1, a2

# CHECK-INST: kdmatt a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0xf2]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: f2c59577 <unknown>
kdmatt a0, a1, a2

# CHECK-INST: kabsw a0, a1
# CHECK-ENCODING: [0x77,0x85,0x45,0xad]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: ad458577 <unknown>
kabsw a0, a1

# 32-bit Computation

# CHECK-INST: raddw a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x20]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 20c59577 <unknown>
raddw a0, a1, a2

# CHECK-INST: uraddw a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x30]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 30c59577 <unknown>
uraddw a0, a1, a2

# CHECK-INST: rsubw a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x22]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 22c59577 <unknown>
rsubw a0, a1, a2

# CHECK-INST: ursubw a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x32]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 32c59577 <unknown>
ursubw a0, a1, a2

# CHECK-INST: maxw a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0xf2]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: f2c58577 <unknown>
maxw a0, a1, a2

# CHECK-INST: minw a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0xf0]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: f0c58577 <unknown>
minw a0, a1, a2

# Overflow/Saturation status manipulation

# CHECK-INST: csrr a5, vxsat
# CHECK-ENCODING: [0xf3,0x27,0x90,0x00]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 009027f3 csrr a5, vxsat
rdov a5

# CHECK-INST: csrci vxsat, 0x1
# CHECK-ENCODING: [0x73,0xf0,0x90,0x00]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 0090f073 csrci vxsat, 0x1
clrov

# Miscellaneous

# CHECK-INST: ave a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0xe0]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: e0c58577 <unknown>
ave a0, a1, a2

# CHECK-INST: sra.u a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x24]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 24c59577 <unknown>
sra.u a0, a1, a2

# CHECK-INST: srai.u a0, a1, 0x9
# CHECK-ENCODING: [0x77,0x95,0x95,0xd4]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: d4959577 <unknown>
srai.u a0, a1, 9

# CHECK-INST: bitrev a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0xe6]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: e6c58577 <unknown>
bitrev a0, a1, a2

# CHECK-INST: bitrevi a0, a1, 0x7
# CHECK-ENCODING: [0x77,0x85,0x75,0xe8]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: e8758577 <unknown>
bitrevi a0, a1, 7

# CHECK-INST: bpick a0, a1, a2, a3
# CHECK-ENCODING: [0x77,0xb5,0xc5,0x68]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 68c5b577 <unknown>
bpick a0, a1, a2, a3

# CHECK-INST: insb a0, a1, 0x3
# CHECK-ENCODING: [0x77,0x85,0x35,0xac]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: ac358577 <unknown>
insb a0, a1, 3

# CHECK-INST: maddr32 a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0xc4]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: c4c59577 <unknown>
maddr32 a0, a1, a2

# CHECK-INST: msubr32 a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0xc6]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: c6c59577 <unknown>
msubr32 a0, a1, a2
