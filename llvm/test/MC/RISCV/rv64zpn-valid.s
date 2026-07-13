# With P extension:
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
# RUN: llvm-mc -triple=riscv64 -show-encoding -print-imm-hex --mattr=+experimental-zpn %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INST
# RUN: not llvm-mc -triple=riscv64 -show-encoding %s 2>&1 \
# RUN:        | FileCheck %s --check-prefix=CHECK-ERROR
# RUN: llvm-mc -triple=riscv64 -filetype=obj --mattr=+experimental-zpn %s \
# RUN:        | llvm-objdump -d --mattr=+experimental-p - \
# RUN:        | FileCheck %s --check-prefix=CHECK-INST
# RUN: llvm-mc -triple=riscv64 -filetype=obj --mattr=+experimental-zpn %s \
# RUN:        | llvm-objdump -d - | FileCheck %s --check-prefix=CHECK-UNKNOWN

# RV64P only

# SIMD 32-bit Add/Subtract

# CHECK-INST: add32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x40]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 40c5a577 <unknown>
add32 a0, a1, a2

# CHECK-INST: radd32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x00]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 00c5a577 <unknown>
radd32 a0, a1, a2

# CHECK-INST: uradd32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x20]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 20c5a577 <unknown>
uradd32 a0, a1, a2

# CHECK-INST: add32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x10]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 10c5a577 <unknown>
kadd32 a0, a1, a2

# CHECK-INST: add32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x30]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 30c5a577 <unknown>
ukadd32 a0, a1, a2

# CHECK-INST: sub32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x42]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 42c5a577 <unknown>
sub32 a0, a1, a2

# CHECK-INST: rsub32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x02]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 02c5a577 <unknown>
rsub32 a0, a1, a2

# CHECK-INST: ursub32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x22]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 22c5a577 <unknown>
ursub32 a0, a1, a2

# CHECK-INST: sub32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x12]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 12c5a577 <unknown>
ksub32 a0, a1, a2

# CHECK-INST: sub32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x32]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 32c5a577 <unknown>
uksub32 a0, a1, a2

# CHECK-INST: cras32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x44]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 44c5a577 <unknown>
cras32 a0, a1, a2

# CHECK-INST: rcras32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x04]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 04c5a577 <unknown>
rcras32 a0, a1, a2

# CHECK-INST: urcras32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x24]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 24c5a577 <unknown>
urcras32 a0, a1, a2

# CHECK-INST: kcras32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x14]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 14c5a577 <unknown>
kcras32 a0, a1, a2

# CHECK-INST: ukcras32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x34]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 34c5a577 <unknown>
ukcras32 a0, a1, a2

# CHECK-INST: crsa32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x46]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 46c5a577 <unknown>
crsa32 a0, a1, a2

# CHECK-INST: rcrsa32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x06]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 06c5a577 <unknown>
rcrsa32 a0, a1, a2

urcrsa32 a0, a1, a2
# CHECK-INST: urcrsa32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x26]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 26c5a577 <unknown>

# CHECK-INST: kcrsa32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x16]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 16c5a577 <unknown>
kcrsa32 a0, a1, a2

# CHECK-INST: ukcrsa32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x36]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 36c5a577 <unknown>
ukcrsa32 a0, a1, a2

# CHECK-INST: stas32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0xf0]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: f0c5a577 <unknown>
stas32 a0, a1, a2

# CHECK-INST: rstas32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0xb0]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: b0c5a577 <unknown>
rstas32 a0, a1, a2

# CHECK-INST: urstas32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0xd0]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: d0c5a577 <unknown>
urstas32 a0, a1, a2

# CHECK-INST: kstas32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0xc0]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: c0c5a577 <unknown>
kstas32 a0, a1, a2

# CHECK-INST: ukstas32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0xe0]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: e0c5a577 <unknown>
ukstas32 a0, a1, a2

# CHECK-INST: stsa32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0xf2]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: f2c5a577 <unknown>
stsa32 a0, a1, a2

# CHECK-INST: rstsa32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0xb2]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: b2c5a577 <unknown>
rstsa32 a0, a1, a2

# CHECK-INST: urstsa32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0xd2]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: d2c5a577 <unknown>
urstsa32 a0, a1, a2

# CHECK-INST: kstsa32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0xc2]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: c2c5a577 <unknown>
kstsa32 a0, a1, a2

# CHECK-INST: ukstsa32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xb5,0xc5,0xe2]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: e2c5b577 <unknown>
ukstsa32 a0, a1, a2

# SIMD 32-bit Shift

# CHECK-INST: sra32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x50]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 50c5a577 <unknown>
sra32 a0, a1, a2

# CHECK-INST: srai32 a0, a1, 0x13
# CHECK-ENCODING: [0x77,0xa5,0x35,0x71]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 7135a577 <unknown>
srai32 a0, a1, 19

# CHECK-INST: sra32.u a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x60]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 60c5a577 <unknown>
sra32.u a0, a1, a2

# CHECK-INST: srai32.u a0, a1, 0x10
# CHECK-ENCODING: [0x77,0xa5,0x05,0x81]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 8105a577 <unknown>
srai32.u a0, a1, 0x10

# CHECK-INST: srl32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x52]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 52c5a577 <unknown>
srl32 a0, a1, a2

# CHECK-INST: srli32 a0, a1, 0x9
# CHECK-ENCODING: [0x77,0xa5,0x95,0x72]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 7295a577 <unknown>
srli32 a0, a1, 0x9

# CHECK-INST: srl32.u a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x62]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 62c5a577 <unknown>
srl32.u a0, a1, a2

# CHECK-INST: srli32.u a0, a1, 0xf
# CHECK-ENCODING: [0x77,0xa5,0xf5,0x82]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 82f5a577 <unknown>
srli32.u a0, a1, 0xf

# CHECK-INST: sll32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x54]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 54c5a577 <unknown>
sll32 a0, a1, a2

# CHECK-INST: slli32 a0, a1, 0x17
# CHECK-ENCODING: [0x77,0xa5,0x75,0x75]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 7575a577 <unknown>
slli32 a0, a1, 0x17

# CHECK-INST: ksll32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x64]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 64c5a577 <unknown>
ksll32 a0, a1, a2

# CHECK-INST: kslli32 a0, a1, 0x1d
# CHECK-ENCODING: [0x77,0xa5,0xd5,0x85]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 85d5a577 <unknown>
kslli32 a0, a1, 0x1d

# CHECK-INST: kslra32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x56]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 56c5a577 <unknown>
kslra32 a0, a1, a2

# CHECK-INST: kslra32.u a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x66]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 66c5a577 <unknown>
kslra32.u a0, a1, a2

# SIMD 32-bit Miscellaneous

# CHECK-INST: smin32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x90]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 90c5a577 <unknown>
smin32 a0, a1, a2

# CHECK-INST: umin32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0xa0]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: a0c5a577 <unknown>
umin32 a0, a1, a2

# CHECK-INST: smax32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x92]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 92c5a577 <unknown>
smax32 a0, a1, a2

# CHECK-INST: umax32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0xa2]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: a2c5a577 <unknown>
umax32 a0, a1, a2

# CHECK-INST: kabs32 a0, a1
# CHECK-ENCODING: [0x77,0x85,0x25,0xad]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: ad258577 <unknown>
kabs32 a0, a1

# SIMD Q15 saturating Multiply

# CHECK-INST: khmbb16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0xdc]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: dcc59577 <unknown>
khmbb16 a0, a1, a2

# CHECK-INST: khmbt16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0xec]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: ecc59577 <unknown>
khmbt16 a0, a1, a2

# CHECK-INST: khmtt16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0xfc]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: fcc59577 <unknown>
khmtt16 a0, a1, a2

# CHECK-INST: kdmbb16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0xda]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: dac59577 <unknown>
kdmbb16 a0, a1, a2

# CHECK-INST: kdmbt16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0xea]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: eac59577 <unknown>
kdmbt16 a0, a1, a2

# CHECK-INST: kdmtt16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0xfa]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: fac59577 <unknown>
kdmtt16 a0, a1, a2

# CHECK-INST: kdmabb16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0xd8]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: d8c59577 <unknown>
kdmabb16 a0, a1, a2

# CHECK-INST: kdmabt16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0xe8]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: e8c59577 <unknown>
kdmabt16 a0, a1, a2

# CHECK-INST: kdmatt16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0xf8]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: f8c59577 <unknown>
kdmatt16 a0, a1, a2

# 32-bit Multiply

# CHECK-INST: smbt32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x18]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 18c5a577 <unknown>
smbt32 a0, a1, a2

# CHECK-INST: smtt32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x28]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 28c5a577 <unknown>
smtt32 a0, a1, a2

# 32-bit Multiply & Add

# CHECK-INST: kmabb32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x5a]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 5ac5a577 <unknown>
kmabb32 a0, a1, a2

# CHECK-INST: kmabt32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x6a]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 6ac5a577 <unknown>
kmabt32 a0, a1, a2

# CHECK-INST: kmatt32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x7a]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 7ac5a577 <unknown>
kmatt32 a0, a1, a2

# CHECK-INST: kmda32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x38]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 38c5a577 <unknown>
kmda32 a0, a1, a2

# CHECK-INST: kmxda32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x3a]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 3ac5a577 <unknown>
kmxda32 a0, a1, a2

# CHECK-INST: kmaxda32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x4a]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 4ac5a577 <unknown>
kmaxda32 a0, a1, a2

# CHECK-INST: kmads32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x5c]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 5cc5a577 <unknown>
kmads32 a0, a1, a2

# CHECK-INST: kmadrs32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x6c]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 6cc5a577 <unknown>
kmadrs32 a0, a1, a2

# CHECK-INST: kmaxds32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x7c]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 7cc5a577 <unknown>
kmaxds32 a0, a1, a2

# CHECK-INST: kmsda32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x4c]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 4cc5a577 <unknown>
kmsda32 a0, a1, a2

# CHECK-INST: kmsxda32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x4e]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 4ec5a577 <unknown>
kmsxda32 a0, a1, a2

# CHECK-INST: smds32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x58]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 58c5a577 <unknown>
smds32 a0, a1, a2

# CHECK-INST: smdrs32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x68]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 68c5a577 <unknown>
smdrs32 a0, a1, a2

# CHECK-INST: smxds32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x78]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 78c5a577 <unknown>
smxds32 a0, a1, a2

# Non-SIMD 32-bit Shift

# CHECK-INST: sraiw.u a0, a1, 0x11
# CHECK-ENCODING: [0x77,0x95,0x15,0x35]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 35159577 <unknown>
sraiw.u a0, a1, 0x11

# 32-bit Packing

# CHECK-INST: pkbt32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x1e]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 1ec5a577 <unknown>
pkbt32 a0, a1, a2

# CHECK-INST: pktb32 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0x3e]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 3ec5a577 <unknown>
pktb32 a0, a1, a2
