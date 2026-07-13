//==- BuiltinsRISCV.td - RISC-V Builtin function database ---*- tablegen -*-==//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines the RISC-V-specific builtin function database.
//
//===----------------------------------------------------------------------===//

include "clang/Basic/BuiltinsBase.td"

class RISCVBuiltin<string prototype, string features = ""> : TargetBuiltin {
  let Spellings = ["__builtin_riscv_" # NAME];
  let Prototype = prototype;
  let Features = features;
}

let Attributes = [NoThrow, Const] in {
//===----------------------------------------------------------------------===//
// Zbb extension.
//===----------------------------------------------------------------------===//
def orc_b_32 : RISCVBuiltin<"unsigned int(unsigned int)", "zbb">;
def orc_b_64 : RISCVBuiltin<"uint64_t(uint64_t)", "zbb,64bit">;
def clz_32 : RISCVBuiltin<"unsigned int(unsigned int)", "zbb|experimental-zbpbo|xtheadbb">;
def clz_64 : RISCVBuiltin<"unsigned int(uint64_t)", "zbb|xtheadbb,64bit">;
def ctz_32 : RISCVBuiltin<"unsigned int(unsigned int)", "zbb">;
def ctz_64 : RISCVBuiltin<"unsigned int(uint64_t)", "zbb,64bit">;

//===----------------------------------------------------------------------===//
// Zbc or Zbkc extension.
//===----------------------------------------------------------------------===//
def clmul_32 : RISCVBuiltin<"unsigned int(unsigned int, unsigned int)", "zbc|zbkc">;
def clmul_64 : RISCVBuiltin<"uint64_t(uint64_t, uint64_t)", "zbc|zbkc,64bit">;
def clmulh_32 : RISCVBuiltin<"unsigned int(unsigned int, unsigned int)", "zbc|zbkc,32bit">;
def clmulh_64 : RISCVBuiltin<"uint64_t(uint64_t, uint64_t)", "zbc|zbkc,64bit">;
def clmulr_32 : RISCVBuiltin<"unsigned int(unsigned int, unsigned int)", "zbc,32bit">;
def clmulr_64 : RISCVBuiltin<"uint64_t(uint64_t, uint64_t)", "zbc,64bit">;

//===----------------------------------------------------------------------===//
// Zbkx extension.
//===----------------------------------------------------------------------===//
let Features = "zbkx,32bit" in {
def xperm4_32 : RISCVBuiltin<"unsigned int(unsigned int, unsigned int)">;
def xperm8_32 : RISCVBuiltin<"unsigned int(unsigned int, unsigned int)">;
} // Features = "zbkx,32bit"

let Features = "zbkx,64bit" in {
def xperm4_64 : RISCVBuiltin<"uint64_t(uint64_t, uint64_t)">;
def xperm8_64 : RISCVBuiltin<"uint64_t(uint64_t, uint64_t)">;
} // Features = "zbkx,64bit"

//===----------------------------------------------------------------------===//
// Zbkb extension.
//===----------------------------------------------------------------------===//
def brev8_32 : RISCVBuiltin<"unsigned int(unsigned int)", "zbkb">;
def brev8_64 : RISCVBuiltin<"uint64_t(uint64_t)", "zbkb,64bit">;
def zip_32 : RISCVBuiltin<"unsigned int(unsigned int)", "zbkb,32bit">;
def unzip_32 : RISCVBuiltin<"unsigned int(unsigned int)", "zbkb,32bit">;

//===----------------------------------------------------------------------===//
// Zknd extension.
//===----------------------------------------------------------------------===//
let Features = "zknd,32bit" in {
def aes32dsi : RISCVBuiltin<"unsigned int(unsigned int, unsigned int, _Constant unsigned int)">;
def aes32dsmi : RISCVBuiltin<"unsigned int(unsigned int, unsigned int, _Constant unsigned int)">;
} // Features = "zknd,32bit"

let Features = "zknd,64bit" in {
def aes64ds : RISCVBuiltin<"uint64_t(uint64_t, uint64_t)">;
def aes64dsm : RISCVBuiltin<"uint64_t(uint64_t, uint64_t)">;
def aes64im : RISCVBuiltin<"uint64_t(uint64_t)">;
} // Features = "zknd,64bit"

//===----------------------------------------------------------------------===//
// Zknd & Zkne extension.
//===----------------------------------------------------------------------===//
let Features = "zknd|zkne,64bit" in {
def aes64ks1i : RISCVBuiltin<"uint64_t(uint64_t, _Constant unsigned int)">;
def aes64ks2 : RISCVBuiltin<"uint64_t(uint64_t, uint64_t)">;
} // Features = "zknd|zkne,64bit"

//===----------------------------------------------------------------------===//
// Zkne extension.
//===----------------------------------------------------------------------===//
let Features = "zkne,32bit" in {
def aes32esi : RISCVBuiltin<"unsigned int(unsigned int, unsigned int, _Constant unsigned int)">;
def aes32esmi : RISCVBuiltin<"unsigned int(unsigned int, unsigned int, _Constant unsigned int)">;
} // Features = "zkne,32bit"

let Features = "zkne,64bit" in {
def aes64es : RISCVBuiltin<"uint64_t(uint64_t, uint64_t)">;
def aes64esm : RISCVBuiltin<"uint64_t(uint64_t, uint64_t)">;
} // Features = "zkne,64bit"

//===----------------------------------------------------------------------===//
// Zknh extension.
//===----------------------------------------------------------------------===//
let Features = "zknh" in {
def sha256sig0 : RISCVBuiltin<"unsigned int(unsigned int)">;
def sha256sig1 : RISCVBuiltin<"unsigned int(unsigned int)">;
def sha256sum0 : RISCVBuiltin<"unsigned int(unsigned int)">;
def sha256sum1 : RISCVBuiltin<"unsigned int(unsigned int)">;
} // Features = "zknh"

let Features = "zknh,32bit" in {
def sha512sig0h : RISCVBuiltin<"unsigned int(unsigned int, unsigned int)">;
def sha512sig0l : RISCVBuiltin<"unsigned int(unsigned int, unsigned int)">;
def sha512sig1h : RISCVBuiltin<"unsigned int(unsigned int, unsigned int)">;
def sha512sig1l : RISCVBuiltin<"unsigned int(unsigned int, unsigned int)">;
def sha512sum0r : RISCVBuiltin<"unsigned int(unsigned int, unsigned int)">;
def sha512sum1r : RISCVBuiltin<"unsigned int(unsigned int, unsigned int)">;
} // Features = "zknh,32bit"

let Features = "zknh,64bit" in {
def sha512sig0 : RISCVBuiltin<"uint64_t(uint64_t)">;
def sha512sig1 : RISCVBuiltin<"uint64_t(uint64_t)">;
def sha512sum0 : RISCVBuiltin<"uint64_t(uint64_t)">;
def sha512sum1 : RISCVBuiltin<"uint64_t(uint64_t)">;
} // Features = "zknh,64bit"

//===----------------------------------------------------------------------===//
// Zksed extension.
//===----------------------------------------------------------------------===//
let Features = "zksed" in {
def sm4ed : RISCVBuiltin<"unsigned int(unsigned int, unsigned int, _Constant unsigned int )">;
def sm4ks : RISCVBuiltin<"unsigned int(unsigned int, unsigned int, _Constant unsigned int)">;
} // Features = "zksed"

//===----------------------------------------------------------------------===//
// Zksh extension.
//===----------------------------------------------------------------------===//
let Features = "zksh" in {
def sm3p0 : RISCVBuiltin<"unsigned int(unsigned int)">;
def sm3p1 : RISCVBuiltin<"unsigned int(unsigned int)">;
} // Features = "zksh"

} // Attributes = [Const, NoThrow]

//===----------------------------------------------------------------------===//
// Zihintntl extension.
//===----------------------------------------------------------------------===//
let Features = "zihintntl", Attributes = [CustomTypeChecking] in {
def ntl_load : RISCVBuiltin<"void(...)">;
def ntl_store : RISCVBuiltin<"void(...)">;
} // Features = "zihintntl", Attributes = [CustomTypeChecking]

//===----------------------------------------------------------------------===//
// XCV extensions.
//===----------------------------------------------------------------------===//
include "clang/Basic/BuiltinsRISCVXCV.td"

// P extensions
def clz : RISCVBuiltin<"unsigned int(unsigned int)", "zbb|experimental-zbpbo">;
def cmix : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int, unsigned long int)", "experimental-zbpbo">;
def fsr : RISCVBuiltin<"unsigned int(unsigned int, unsigned int, unsigned int)", "experimental-zbpbo">;
def fsrw : RISCVBuiltin<"unsigned int(unsigned int, unsigned int, unsigned int)", "experimental-zbpbo">;
def max : RISCVBuiltin<"long int(long int, long int)", "experimental-zbpbo">;
def min : RISCVBuiltin<"long int(long int, long int)", "experimental-zbpbo">;
def pack : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zbpbo">;
def packu : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zbpbo">;
def rev : RISCVBuiltin<"unsigned long int(unsigned long int)", "experimental-zbpbo">;
def rev8h : RISCVBuiltin<"unsigned long int(unsigned long int)", "experimental-zbpbo">;
def add8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def add16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def ave : RISCVBuiltin<"long int(long int, long int)", "experimental-zpn">;
def bitrev : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned int)", "experimental-zpn">;
def bpick : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int, unsigned long int)", "experimental-zpn">;
def clrs8 : RISCVBuiltin<"unsigned long int(unsigned long int)", "experimental-zpn">;
def clrs16 : RISCVBuiltin<"unsigned long int(unsigned long int)", "experimental-zpn">;
def clrs32 : RISCVBuiltin<"unsigned long int(long int)", "experimental-zpn">;
def clz8 : RISCVBuiltin<"unsigned long int(unsigned long int)", "experimental-zpn">;
def clz16 : RISCVBuiltin<"unsigned long int(unsigned long int)", "experimental-zpn">;
def clz32 : RISCVBuiltin<"unsigned long int(unsigned long int)", "experimental-zpn">;
def cmpeq8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def cmpeq16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def cras16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def crsa16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def insb : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int, unsigned int)", "experimental-zpn">;
def kabs8 : RISCVBuiltin<"unsigned long int(unsigned long int)", "experimental-zpn">;
def kabs16 : RISCVBuiltin<"unsigned long int(unsigned long int)", "experimental-zpn">;
def kabsw : RISCVBuiltin<"int(int)", "experimental-zpn">;
def kadd8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def kadd16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def kaddh : RISCVBuiltin<"int(int, int)", "experimental-zpn">;
def kaddw : RISCVBuiltin<"int(int, int)", "experimental-zpn">;
def kcras16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def kcrsa16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def kdmbb : RISCVBuiltin<"int(unsigned int, unsigned int)", "experimental-zpn">;
def kdmbt : RISCVBuiltin<"int(unsigned int, unsigned int)", "experimental-zpn">;
def kdmtt : RISCVBuiltin<"int(unsigned int, unsigned int)", "experimental-zpn">;
def kdmabb : RISCVBuiltin<"int(int, unsigned int, unsigned int)", "experimental-zpn">;
def kdmabt : RISCVBuiltin<"int(int, unsigned int, unsigned int)", "experimental-zpn">;
def kdmatt : RISCVBuiltin<"int(int, unsigned int, unsigned int)", "experimental-zpn">;
def khm8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def khmx8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def khm16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def khmx16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def khmbb : RISCVBuiltin<"int(unsigned int, unsigned int)", "experimental-zpn">;
def khmbt : RISCVBuiltin<"int(unsigned int, unsigned int)", "experimental-zpn">;
def khmtt : RISCVBuiltin<"int(unsigned int, unsigned int)", "experimental-zpn">;
def kmabb : RISCVBuiltin<"long int(long int, unsigned long int, unsigned long int)", "experimental-zpn">;
def kmabt : RISCVBuiltin<"long int(long int, unsigned long int, unsigned long int)", "experimental-zpn">;
def kmatt : RISCVBuiltin<"long int(long int, unsigned long int, unsigned long int)", "experimental-zpn">;
def kmada : RISCVBuiltin<"long int(long int, unsigned long int, unsigned long int)", "experimental-zpn">;
def kmaxda : RISCVBuiltin<"long int(long int, unsigned long int, unsigned long int)", "experimental-zpn">;
def kmads : RISCVBuiltin<"long int(long int, unsigned long int, unsigned long int)", "experimental-zpn">;
def kmadrs : RISCVBuiltin<"long int(long int, unsigned long int, unsigned long int)", "experimental-zpn">;
def kmaxds : RISCVBuiltin<"long int(long int, unsigned long int, unsigned long int)", "experimental-zpn">;
def kmda : RISCVBuiltin<"long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def kmxda : RISCVBuiltin<"long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def kmmac : RISCVBuiltin<"long int(long int, long int, long int)", "experimental-zpn">;
def kmmac_u : RISCVBuiltin<"long int(long int, long int, long int)", "experimental-zpn">;
def kmmawb : RISCVBuiltin<"long int(long int, long int, unsigned long int)", "experimental-zpn">;
def kmmawb_u : RISCVBuiltin<"long int(long int, long int, unsigned long int)", "experimental-zpn">;
def kmmawb2 : RISCVBuiltin<"long int(long int, long int, unsigned long int)", "experimental-zpn">;
def kmmawb2_u : RISCVBuiltin<"long int(long int, long int, unsigned long int)", "experimental-zpn">;
def kmmawt : RISCVBuiltin<"long int(long int, long int, unsigned long int)", "experimental-zpn">;
def kmmawt_u : RISCVBuiltin<"long int(long int, long int, unsigned long int)", "experimental-zpn">;
def kmmawt2 : RISCVBuiltin<"long int(long int, long int, unsigned long int)", "experimental-zpn">;
def kmmawt2_u : RISCVBuiltin<"long int(long int, long int, unsigned long int)", "experimental-zpn">;
def kmmsb : RISCVBuiltin<"long int(long int, long int, long int)", "experimental-zpn">;
def kmmsb_u : RISCVBuiltin<"long int(long int, long int, long int)", "experimental-zpn">;
def kmmwb2 : RISCVBuiltin<"long int(long int, unsigned long int)", "experimental-zpn">;
def kmmwb2_u : RISCVBuiltin<"long int(long int, unsigned long int)", "experimental-zpn">;
def kmmwt2 : RISCVBuiltin<"long int(long int, unsigned long int)", "experimental-zpn">;
def kmmwt2_u : RISCVBuiltin<"long int(long int, unsigned long int)", "experimental-zpn">;
def kmsda : RISCVBuiltin<"long int(long int, unsigned long int, unsigned long int)", "experimental-zpn">;
def kmsxda : RISCVBuiltin<"long int(long int, unsigned long int, unsigned long int)", "experimental-zpn">;
def ksllw : RISCVBuiltin<"int(int, unsigned int)", "experimental-zpn">;
def ksll8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned int)", "experimental-zpn">;
def ksll16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned int)", "experimental-zpn">;
def kslra8 : RISCVBuiltin<"unsigned long int(unsigned long int, int)", "experimental-zpn">;
def kslra8_u : RISCVBuiltin<"unsigned long int(unsigned long int, int)", "experimental-zpn">;
def kslra16 : RISCVBuiltin<"unsigned long int(unsigned long int, int)", "experimental-zpn">;
def kslra16_u : RISCVBuiltin<"unsigned long int(unsigned long int, int)", "experimental-zpn">;
def kslraw : RISCVBuiltin<"long int(int, int)", "experimental-zpn">;
def kslraw_u : RISCVBuiltin<"long int(int, int)", "experimental-zpn">;
def kstas16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def kstsa16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def ksub8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def ksub16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def ksubh : RISCVBuiltin<"int(int, int)", "experimental-zpn">;
def ksubw : RISCVBuiltin<"int(int, int)", "experimental-zpn">;
def kwmmul : RISCVBuiltin<"long int(long int, long int)", "experimental-zpn">;
def kwmmul_u : RISCVBuiltin<"long int(long int, long int)", "experimental-zpn">;
def maddr32 : RISCVBuiltin<"int(int, int, int)", "experimental-zpn">;
def msubr32 : RISCVBuiltin<"int(int, int, int)", "experimental-zpn">;
def maxw : RISCVBuiltin<"int(int, int)", "experimental-zpn">;
def minw : RISCVBuiltin<"int(int, int)", "experimental-zpn">;
def pbsad : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def pbsada : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int, unsigned long int)", "experimental-zpn">;
def pkbb16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def pkbt16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def pktt16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def pktb16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def radd8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def radd16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def raddw : RISCVBuiltin<"int(int, int)", "experimental-zpn">;
def rcras16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def rcrsa16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def rstas16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def rstsa16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def rsub8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def rsub16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def rsubw : RISCVBuiltin<"int(int, int)", "experimental-zpn">;
def sclip8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned int)", "experimental-zpn">;
def sclip16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned int)", "experimental-zpn">;
def sclip32 : RISCVBuiltin<"long int(long int, unsigned int)", "experimental-zpn">;
def scmple8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def scmple16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def scmplt8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def scmplt16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def sll8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned int)", "experimental-zpn">;
def sll16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned int)", "experimental-zpn">;
def smaqa : RISCVBuiltin<"long int(long int, unsigned long int, unsigned long int)", "experimental-zpn">;
def smaqa_su : RISCVBuiltin<"long int(long int, unsigned long int, unsigned long int)", "experimental-zpn">;
def smax8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def smax16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def smbb16 : RISCVBuiltin<"long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def smbt16 : RISCVBuiltin<"long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def smtt16 : RISCVBuiltin<"long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def smds : RISCVBuiltin<"long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def smdrs : RISCVBuiltin<"long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def smxds : RISCVBuiltin<"long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def smin8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def smin16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def smmul : RISCVBuiltin<"long int(long int, long int)", "experimental-zpn">;
def smmul_u : RISCVBuiltin<"long int(long int, long int)", "experimental-zpn">;
def smmwb : RISCVBuiltin<"long int(long int, unsigned long int)", "experimental-zpn">;
def smmwb_u : RISCVBuiltin<"long int(long int, unsigned long int)", "experimental-zpn">;
def smmwt : RISCVBuiltin<"long int(long int, unsigned long int)", "experimental-zpn">;
def smmwt_u : RISCVBuiltin<"long int(long int, unsigned long int)", "experimental-zpn">;
def sra_u : RISCVBuiltin<"long int(long int, unsigned int)", "experimental-zpn">;
def sra8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned int)", "experimental-zpn">;
def sra8_u : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned int)", "experimental-zpn">;
def sra16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned int)", "experimental-zpn">;
def sra16_u : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned int)", "experimental-zpn">;
def srl8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned int)", "experimental-zpn">;
def srl8_u : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned int)", "experimental-zpn">;
def srl16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned int)", "experimental-zpn">;
def srl16_u : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned int)", "experimental-zpn">;
def stas16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def stsa16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def sub8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def sub16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def sunpkd810 : RISCVBuiltin<"unsigned long int(unsigned long int)", "experimental-zpn">;
def sunpkd820 : RISCVBuiltin<"unsigned long int(unsigned long int)", "experimental-zpn">;
def sunpkd830 : RISCVBuiltin<"unsigned long int(unsigned long int)", "experimental-zpn">;
def sunpkd831 : RISCVBuiltin<"unsigned long int(unsigned long int)", "experimental-zpn">;
def sunpkd832 : RISCVBuiltin<"unsigned long int(unsigned long int)", "experimental-zpn">;
def swap16 : RISCVBuiltin<"unsigned long int(unsigned long int)", "experimental-zpn">;
def uclip8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned int)", "experimental-zpn">;
def uclip16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned int)", "experimental-zpn">;
def uclip32 : RISCVBuiltin<"unsigned long int(long int, unsigned int)", "experimental-zpn">;
def ucmple8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def ucmple16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def ucmplt8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def ucmplt16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def ukadd8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def ukadd16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def ukaddh : RISCVBuiltin<"unsigned int(unsigned int, unsigned int)", "experimental-zpn">;
def ukaddw : RISCVBuiltin<"unsigned int(unsigned int, unsigned int)", "experimental-zpn">;
def ukcras16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def ukcrsa16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def ukstas16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def ukstsa16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def uksub8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def uksub16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def uksubh : RISCVBuiltin<"unsigned int(unsigned int, unsigned int)", "experimental-zpn">;
def uksubw : RISCVBuiltin<"unsigned int(unsigned int, unsigned int)", "experimental-zpn">;
def umaqa : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int, unsigned long int)", "experimental-zpn">;
def umax8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def umax16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def umin8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def umin16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def uradd8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def uradd16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def uraddw : RISCVBuiltin<"unsigned int(unsigned int, unsigned int)", "experimental-zpn">;
def urcras16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def urcrsa16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def urstas16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def urstsa16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def ursub8 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def ursub16 : RISCVBuiltin<"unsigned long int(unsigned long int, unsigned long int)", "experimental-zpn">;
def ursubw : RISCVBuiltin<"unsigned int(unsigned int, unsigned int)", "experimental-zpn">;
def zunpkd810 : RISCVBuiltin<"unsigned long int(unsigned long int)", "experimental-zpn">;
def zunpkd820 : RISCVBuiltin<"unsigned long int(unsigned long int)", "experimental-zpn">;
def zunpkd830 : RISCVBuiltin<"unsigned long int(unsigned long int)", "experimental-zpn">;
def zunpkd831 : RISCVBuiltin<"unsigned long int(unsigned long int)", "experimental-zpn">;
def zunpkd832 : RISCVBuiltin<"unsigned long int(unsigned long int)", "experimental-zpn">;
