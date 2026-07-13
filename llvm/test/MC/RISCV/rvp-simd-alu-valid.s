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

# SIMD 16-bit Add/Subtract

# CHECK-INST: add16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x40]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 40c58577 <unknown>
add16 a0, a1, a2

# CHECK-INST: radd16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x00]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 00c58577 <unknown>
radd16 a0, a1, a2

# CHECK-INST: uradd16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x20]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 20c58577 <unknown>
uradd16 a0, a1, a2

# CHECK-INST: kadd16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x10]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 10c58577 <unknown>
kadd16 a0, a1, a2

# CHECK-INST: ukadd16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x30]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 30c58577 <unknown>
ukadd16 a0, a1, a2

# CHECK-INST: sub16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x42]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 42c58577 <unknown>
sub16 a0, a1, a2

# CHECK-INST: rsub16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x02]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 02c58577 <unknown>
rsub16 a0, a1, a2

# CHECK-INST: ursub16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x22]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 22c58577 <unknown>
ursub16 a0, a1, a2

# CHECK-INST: ksub16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x12]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 12c58577 <unknown>
ksub16 a0, a1, a2

# CHECK-INST: uksub16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x32]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 32c58577 <unknown>
uksub16 a0, a1, a2

# CHECK-INST: cras16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x44]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 44c58577 <unknown>
cras16 a0, a1, a2

# CHECK-INST: rcras16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x04]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 04c58577 <unknown>
rcras16 a0, a1, a2

# CHECK-INST: urcras16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x24]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 24c58577 <unknown>
urcras16 a0, a1, a2

# CHECK-INST: kcras16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x14]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 14c58577 <unknown>
kcras16 a0, a1, a2

# CHECK-INST: ukcras16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x34]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 34c58577 <unknown>
ukcras16 a0, a1, a2

# CHECK-INST: crsa16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x46]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 46c58577 <unknown>
crsa16 a0, a1, a2

# CHECK-INST: rcrsa16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x06]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 06c58577 <unknown>
rcrsa16 a0, a1, a2

# CHECK-INST: urcrsa16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x26]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 26c58577 <unknown>
urcrsa16 a0, a1, a2

# CHECK-INST: kcrsa16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x16]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 16c58577 <unknown>
kcrsa16 a0, a1, a2

# CHECK-INST: ukcrsa16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x36]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 36c58577 <unknown>
ukcrsa16 a0, a1, a2

# CHECK-INST: stas16 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0xf4]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: f4c5a577 <unknown>
stas16 a0, a1, a2

# CHECK-INST: rstas16 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0xb4]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: b4c5a577 <unknown>
rstas16 a0, a1, a2

# CHECK-INST: urstas16 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0xd4]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: d4c5a577 <unknown>
urstas16 a0, a1, a2

# CHECK-INST: kstas16 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0xc4]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: c4c5a577 <unknown>
kstas16 a0, a1, a2

# CHECK-INST: ukstas16 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0xe4]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: e4c5a577 <unknown>
ukstas16 a0, a1, a2

# CHECK-INST: stsa16 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0xf6]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: f6c5a577 <unknown>
stsa16 a0, a1, a2

# CHECK-INST: rstsa16 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0xb6]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: b6c5a577 <unknown>
rstsa16 a0, a1, a2

# CHECK-INST: urstsa16 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0xd6]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: d6c5a577 <unknown>
urstsa16 a0, a1, a2

# CHECK-INST: kstsa16 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0xc6]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: c6c5a577 <unknown>
kstsa16 a0, a1, a2

# CHECK-INST: ukstsa16 a0, a1, a2
# CHECK-ENCODING: [0x77,0xa5,0xc5,0xe6]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: e6c5a577 <unknown>
ukstsa16 a0, a1, a2

# SIMD 8-bit Add/Subtract

# CHECK-INST: add8 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x48]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 48c58577 <unknown>
add8 a0, a1, a2

# CHECK-INST: radd8 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x08]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 08c58577 <unknown>
radd8 a0, a1, a2

# CHECK-INST: uradd8 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x28]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 28c58577 <unknown>
uradd8 a0, a1, a2

# CHECK-INST: kadd8 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x18]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 18c58577 <unknown>
kadd8 a0, a1, a2

# CHECK-INST: ukadd8 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x38]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 38c58577 <unknown>
ukadd8 a0, a1, a2

# CHECK-INST: sub8 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x4a]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 4ac58577 <unknown>
sub8 a0, a1, a2

# CHECK-INST: rsub8 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x0a]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 0ac58577 <unknown>
rsub8 a0, a1, a2

# CHECK-INST: ursub8 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x2a]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 2ac58577 <unknown>
ursub8 a0, a1, a2

# CHECK-INST: ksub8 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x1a]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 1ac58577 <unknown>
ksub8 a0, a1, a2

# CHECK-INST: uksub8 a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0x3a]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 3ac58577 <unknown>
uksub8 a0, a1, a2
