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

# 16-bit Packing

# CHECK-INST: pkbt16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x1e]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 1ec59577 <unknown>
pkbt16 a0, a1, a2

# CHECK-INST: pktb16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x3e]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 3ec59577 <unknown>
pktb16 a0, a1, a2

# Signed MSW 32x32 Multiply and Add

# CHECK-INST: smmul a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x40]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 40c59577 <unknown>
smmul a0, a1, a2

# CHECK-INST: smmul.u a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x50]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 50c59577 <unknown>
smmul.u a0, a1, a2

# CHECK-INST: kmmac a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x60]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 60c59577 <unknown>
kmmac a0, a1, a2

# CHECK-INST: kmmac.u a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x70]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 70c59577 <unknown>
kmmac.u a0, a1, a2

# CHECK-INST: kmmsb a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x42]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 42c59577 <unknown>
kmmsb a0, a1, a2

# CHECK-INST: kmmsb.u a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x52]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 52c59577 <unknown>
kmmsb.u a0, a1, a2

# CHECK-INST: kwmmul a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x62]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 62c59577 <unknown>
kwmmul a0, a1, a2

# CHECK-INST: kwmmul.u a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x72]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 72c59577 <unknown>
kwmmul.u a0, a1, a2

# Signed MSW 32x16 Multiply and Add

# CHECK-INST: smmwb a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x44]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 44c59577 <unknown>
smmwb a0, a1, a2

# CHECK-INST: smmwb.u a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x54]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 54c59577 <unknown>
smmwb.u a0, a1, a2

# CHECK-INST: smmwt a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x64]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 64c59577 <unknown>
smmwt a0, a1, a2

# CHECK-INST: smmwt.u a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x74]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 74c59577 <unknown>
smmwt.u a0, a1, a2

# CHECK-INST: kmmawb a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x46]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 46c59577 <unknown>
kmmawb a0, a1, a2

# CHECK-INST: kmmawb.u a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x56]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 56c59577 <unknown>
kmmawb.u a0, a1, a2

# CHECK-INST: kmmawt a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x66]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 66c59577 <unknown>
kmmawt a0, a1, a2

# CHECK-INST: kmmawt.u a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x76]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 76c59577 <unknown>
kmmawt.u a0, a1, a2

# CHECK-INST: kmmwb2 a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x8e]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 8ec59577 <unknown>
kmmwb2 a0, a1, a2

# CHECK-INST: kmmwb2.u a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x9e]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 9ec59577 <unknown>
kmmwb2.u a0, a1, a2

# CHECK-INST: kmmwt2 a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0xae]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: aec59577 <unknown>
kmmwt2 a0, a1, a2

# CHECK-INST: kmmwt2.u a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0xbe]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: bec59577 <unknown>
kmmwt2.u a0, a1, a2

# CHECK-INST: kmmawb2 a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0xce]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: cec59577 <unknown>
kmmawb2 a0, a1, a2

# CHECK-INST: kmmawb2.u a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0xde]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: dec59577 <unknown>
kmmawb2.u a0, a1, a2

# CHECK-INST: kmmawt2 a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0xee]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: eec59577 <unknown>
kmmawt2 a0, a1, a2

# CHECK-INST: kmmawt2.u a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0xfe]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: fec59577 <unknown>
kmmawt2.u a0, a1, a2

# Signed 16-bit Multiply with 32-bit Add/Subtract

# CHECK-INST: smbb16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x08]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 08c59577 <unknown>
smbb16 a0, a1, a2

# CHECK-INST: smbt16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x18]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 18c59577 <unknown>
smbt16 a0, a1, a2

# CHECK-INST: smtt16 a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x28]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 28c59577 <unknown>
smtt16 a0, a1, a2

# CHECK-INST: kmda a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x38]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 38c59577 <unknown>
kmda a0, a1, a2

# CHECK-INST: kmxda a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x3a]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 3ac59577 <unknown>
kmxda a0, a1, a2

# CHECK-INST: smds a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x58]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 58c59577 <unknown>
smds a0, a1, a2

# CHECK-INST: smdrs a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x68]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 68c59577 <unknown>
smdrs a0, a1, a2

# CHECK-INST: smxds a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x78]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 78c59577 <unknown>
smxds a0, a1, a2

# CHECK-INST: kmabb a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x5a]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 5ac59577 <unknown>
kmabb a0, a1, a2

# CHECK-INST: kmabt a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x6a]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 6ac59577 <unknown>
kmabt a0, a1, a2

# CHECK-INST: kmatt a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x7a]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 7ac59577 <unknown>
kmatt a0, a1, a2

# CHECK-INST: kmada a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x48]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 48c59577 <unknown>
kmada a0, a1, a2

# CHECK-INST: kmaxda a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x4a]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 4ac59577 <unknown>
kmaxda a0, a1, a2

# CHECK-INST: kmads a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x5c]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 5cc59577 <unknown>
kmads a0, a1, a2

# CHECK-INST: kmadrs a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x6c]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 6cc59577 <unknown>
kmadrs a0, a1, a2

# CHECK-INST: kmaxds a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x7c]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 7cc59577 <unknown>
kmaxds a0, a1, a2

# CHECK-INST: kmsda a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x4c]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 4cc59577 <unknown>
kmsda a0, a1, a2

# CHECK-INST: kmsxda a0, a1, a2
# CHECK-ENCODING: [0x77,0x95,0xc5,0x4e]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: 4ec59577 <unknown>
kmsxda a0, a1, a2

# Miscellaneous

# CHECK-INST: sclip32 a0, a1, 0x15
# CHECK-ENCODING: [0x77,0x85,0x55,0xe5]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: e5558577 <unknown>
sclip32 a0, a1, 21

# CHECK-INST: uclip32 a0, a1, 0x13
# CHECK-ENCODING: [0x77,0x85,0x35,0xf5]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: f5358577 <unknown>
uclip32 a0, a1, 19

# CHECK-INST: clrs32 a0, a1
# CHECK-ENCODING: [0x77,0x85,0x85,0xaf]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: af858577 <unknown>
clrs32 a0, a1

# CHECK-INST: pbsad a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0xfc]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: fcc58577 <unknown>
pbsad a0, a1, a2

# CHECK-INST: pbsada a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0xfe]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: fec58577 <unknown>
pbsada a0, a1, a2

# 8-bit Multiply with 32-bit Add

# CHECK-INST: smaqa a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0xc8]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: c8c58577 <unknown>
smaqa a0, a1, a2

# CHECK-INST: umaqa a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0xcc]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: ccc58577 <unknown>
umaqa a0, a1, a2

# CHECK-INST: smaqa.su a0, a1, a2
# CHECK-ENCODING: [0x77,0x85,0xc5,0xca]
# CHECK-ERROR: instruction requires the following: 'Zpn' (Normal 'P' Instructions)
# CHECK-UNKNOWN: cac58577 <unknown>
smaqa.su a0, a1, a2
