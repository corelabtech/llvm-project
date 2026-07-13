# RUN: llvm-mc %s -triple=riscv32 -mattr=+experimental-zbpbo -riscv-no-aliases -show-encoding \
# RUN:     | FileCheck -check-prefixes=CHECK-ASM,CHECK-ASM-AND-OBJ %s
# RUN: llvm-mc -filetype=obj -triple=riscv32 -mattr=+experimental-zbpbo < %s \
# RUN:     | llvm-objdump --mattr=+experimental-zbpbo -M no-aliases -d -r - \
# RUN:     | FileCheck --check-prefix=CHECK-ASM-AND-OBJ %s

# CHECK-ASM-AND-OBJ: clz t0, t1
# CHECK-ASM: encoding: [0x93,0x12,0x03,0x60]
clz t0, t1

# CHECK-ASM-AND-OBJ: pack t0, t1, t2
# CHECK-ASM: encoding: [0xb3,0x42,0x73,0x08]
pack t0, t1, t2

# CHECK-ASM-AND-OBJ: packu t0, t1, t2
# CHECK-ASM: encoding: [0xb3,0x42,0x73,0x48]
packu t0, t1, t2

# CHECK-ASM-AND-OBJ: fsr t0, t1, t2, t3
# CHECK-ASM: encoding: [0xb3,0x52,0xc3,0x3d]
fsr t0, t1, t2, t3

# CHECK-ASM-AND-OBJ: fsri t0, t1, t2, 0
# CHECK-ASM: encoding: [0x93,0x52,0x03,0x3c]
fsri t0, t1, t2, 0

# CHECK-ASM-AND-OBJ: max t0, t1, t2
# CHECK-ASM: encoding: [0xb3,0x62,0x73,0x0a]
max t0, t1, t2

# CHECK-ASM-AND-OBJ: min t0, t1, t2
# CHECK-ASM: encoding: [0xb3,0x42,0x73,0x0a]
min t0, t1, t2

# CHECK-ASM-AND-OBJ: cmix t0, t1, t2, t3
# CHECK-ASM: encoding: [0xb3,0x92,0x63,0xe6]
cmix t0, t1, t2, t3
