# RUN: llvm-mc %s -triple=riscv64 -mattr=+experimental-zbpbo -riscv-no-aliases -show-encoding \
# RUN:     | FileCheck -check-prefixes=CHECK-ASM,CHECK-ASM-AND-OBJ %s
# RUN: llvm-mc -filetype=obj -triple=riscv64 -mattr=+experimental-zbpbo < %s \
# RUN:     | llvm-objdump --mattr=+experimental-zbpbo -M no-aliases -d -r - \
# RUN:     | FileCheck --check-prefix=CHECK-ASM-AND-OBJ %s

# CHECK-ASM-AND-OBJ: pack t0, t1, t2
# CHECK-ASM: encoding: [0xb3,0x42,0x73,0x08]
pack t0, t1, t2

# CHECK-ASM-AND-OBJ: packu t0, t1, t2
# CHECK-ASM: encoding: [0xb3,0x42,0x73,0x48]
packu t0, t1, t2

# CHECK-ASM-AND-OBJ: fsrw t0, t1, t2, t3
# CHECK-ASM: encoding: [0xbb,0x52,0xc3,0x3d]
fsrw t0, t1, t2, t3

# CHECK-ASM-AND-OBJ: max t0, t1, t2
# CHECK-ASM: encoding: [0xb3,0x62,0x73,0x0a]
max t0, t1, t2

# CHECK-ASM-AND-OBJ: min t0, t1, t2
# CHECK-ASM: encoding: [0xb3,0x42,0x73,0x0a]
min t0, t1, t2

# CHECK-ASM-AND-OBJ: cmix t0, t1, t2, t3
# CHECK-ASM: encoding: [0xb3,0x92,0x63,0xe6]
cmix t0, t1, t2, t3
