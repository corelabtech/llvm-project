//==- RISCVSchedCoreLabJuniper.td - CoreLab Juniper Scheduling Definitions --*- tablegen -*-=//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//

// CoreLab Juniper machine model for scheduling and other instruction cost heuristics.
def CoreLabJuniperModel : SchedMachineModel {
  let MicroOpBufferSize = 0; // Explicitly set to zero since it is in-order.
  let IssueWidth = 2;        // 2 micro-ops are dispatched per cycle.
  let LoadLatency = 2;
  let MispredictPenalty = 3;
  let CompleteModel = 0;
  let EnableIntervals = true;
  let UnsupportedFeatures = [HasStdExtZbkb, HasStdExtZbkc, HasStdExtZbkx,
                             HasStdExtZcmt, HasStdExtZknd, HasStdExtZkne,
                             HasStdExtZknh, HasStdExtZksed, HasStdExtZksh,
                             HasStdExtZcmp, HasStdExtZkr, HasStdExtZvkned,
                             HasVInstructions];
}

// CoreLab Juniper: 1*jmp + 2*alu + 1*mdu + 1*fpu + 2*ld + 1*st
let SchedModel = CoreLabJuniperModel in {

// The reservation stations are distributed and grouped as 32-entry or 16-entry smaller ones.
let BufferSize = 0 in {
  def CoreLabJuniperJMP : ProcResource<1>;
  def CoreLabJuniperALU : ProcResource<2>;
  def CoreLabJuniperMDU : ProcResource<1>;
  def CoreLabJuniperFMISC : ProcResource<1>;
  def CoreLabJuniperLD : ProcResource<2>;
  def CoreLabJuniperST : ProcResource<1>;
}

// Branching
let Latency = 1 in {
  def : WriteRes<WriteJmp, [CoreLabJuniperJMP]>;
  def : WriteRes<WriteJal, [CoreLabJuniperJMP]>;
  def : WriteRes<WriteJalr, [CoreLabJuniperJMP]>;
}

// Integer arithmetic and logic
let Latency = 1 in {
  def : WriteRes<WriteIALU, [CoreLabJuniperALU]>;
  def : WriteRes<WriteIALU32, [CoreLabJuniperALU]>;
  def : WriteRes<WriteShiftImm, [CoreLabJuniperALU]>;
  def : WriteRes<WriteShiftImm32, [CoreLabJuniperALU]>;
  def : WriteRes<WriteShiftReg, [CoreLabJuniperALU]>;
  def : WriteRes<WriteShiftReg32, [CoreLabJuniperALU]>;
}

// Integer multiplication
let Latency = 2 in {
  def : WriteRes<WriteIMul, [CoreLabJuniperMDU]>;
  def : WriteRes<WriteIMul32, [CoreLabJuniperMDU]>;
}

// Integer division
let Latency = 6 in {
  def : WriteRes<WriteIDiv32, [CoreLabJuniperMDU]>;
  def : WriteRes<WriteIDiv, [CoreLabJuniperMDU]>;
  def : WriteRes<WriteIRem, [CoreLabJuniperMDU]>;
  def : WriteRes<WriteIRem32, [CoreLabJuniperMDU]>;
}

// Zb*
let Latency = 1 in {
  // Zba
  def : WriteRes<WriteSHXADD, [CoreLabJuniperALU]>;
  def : WriteRes<WriteSHXADD32, [CoreLabJuniperALU]>;

  // Zbb
  def : WriteRes<WriteRotateImm, [CoreLabJuniperALU]>;
  def : WriteRes<WriteRotateImm32, [CoreLabJuniperALU]>;
  def : WriteRes<WriteRotateReg, [CoreLabJuniperALU]>;
  def : WriteRes<WriteRotateReg32, [CoreLabJuniperALU]>;
  def : WriteRes<WriteORCB, [CoreLabJuniperALU]>;
  def : WriteRes<WriteREV8, [CoreLabJuniperALU]>;

  // Zbkc
  def : WriteRes<WriteCLMUL, [CoreLabJuniperMDU]>;

  // Zbkb
  def : WriteRes<WriteBREV8, [CoreLabJuniperALU]>;
  def : WriteRes<WritePACK, [CoreLabJuniperALU]>;
  def : WriteRes<WritePACK32, [CoreLabJuniperALU]>;
  def : WriteRes<WriteZIP, [CoreLabJuniperALU]>;

  // Zbs
  def : WriteRes<WriteSingleBit, [CoreLabJuniperALU]>;
  def : WriteRes<WriteSingleBitImm, [CoreLabJuniperALU]>;
  def : WriteRes<WriteBEXT, [CoreLabJuniperALU]>;
  def : WriteRes<WriteBEXTI, [CoreLabJuniperALU]>;
}

let Latency = 1 in {
  // Zbb
  def : WriteRes<WriteCLZ, [CoreLabJuniperMDU]>;
  def : WriteRes<WriteCLZ32, [CoreLabJuniperMDU]>;
  def : WriteRes<WriteCTZ, [CoreLabJuniperMDU]>;
  def : WriteRes<WriteCTZ32, [CoreLabJuniperMDU]>;
  def : WriteRes<WriteCPOP, [CoreLabJuniperMDU]>;
  def : WriteRes<WriteCPOP32, [CoreLabJuniperMDU]>;
  // Zbkx
  def : WriteRes<WriteXPERM, [CoreLabJuniperMDU]>;
}

// Memory
let Latency = 2 in {
  def : WriteRes<WriteSTB, [CoreLabJuniperST]>;
  def : WriteRes<WriteSTH, [CoreLabJuniperST]>;
  def : WriteRes<WriteSTW, [CoreLabJuniperST]>;
  def : WriteRes<WriteFST32, [CoreLabJuniperST]>;
  def : WriteRes<WriteAtomicSTW, [CoreLabJuniperST]>;

  def : WriteRes<WriteLDB, [CoreLabJuniperLD]>;
  def : WriteRes<WriteLDH, [CoreLabJuniperLD]>;
  def : WriteRes<WriteLDW, [CoreLabJuniperLD]>;
  def : WriteRes<WriteAtomicW, [CoreLabJuniperLD]>;
  def : WriteRes<WriteAtomicD, [CoreLabJuniperLD]>;
  def : WriteRes<WriteAtomicLDW, [CoreLabJuniperLD]>;
  def : WriteRes<WriteFLD32, [CoreLabJuniperLD]>;
}

let Latency = 3 in {
  def : WriteRes<WriteSTD, [CoreLabJuniperST]>;
  def : WriteRes<WriteFST64, [CoreLabJuniperST]>;
  def : WriteRes<WriteAtomicSTD, [CoreLabJuniperST]>;

  def : WriteRes<WriteLDD, [CoreLabJuniperLD]>;
  def : WriteRes<WriteAtomicLDD, [CoreLabJuniperLD]>;
  def : WriteRes<WriteFLD64, [CoreLabJuniperLD]>;
}

// FP
let Latency = 2 in {
  def : WriteRes<WriteFAdd32, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFSGNJ32, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFMinMax32, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFAdd64, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFSGNJ64, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFMinMax64, [CoreLabJuniperFMISC]>;

  def : WriteRes<WriteFCvtI32ToF32, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFCvtI32ToF64, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFCvtI64ToF32, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFCvtI64ToF64, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFCvtF32ToI32, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFCvtF32ToI64, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFCvtF64ToI32, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFCvtF64ToI64, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFCvtF32ToF64, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFCvtF64ToF32, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFCvtF32ToF16, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFCvtF16ToF64, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFCvtF64ToF16, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFCvtF16ToF32, [CoreLabJuniperFMISC]>;

  def : WriteRes<WriteFClass32, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFClass64, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFCmp32, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFCmp64, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFMovF32ToI32, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFMovI32ToF32, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFMovF64ToI64, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFMovI64ToF64, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFMovI16ToF16, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFMovF16ToI16, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFLD16, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFST16, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteIMinMax, [CoreLabJuniperFMISC]>;
}

// FP multiplication
let Latency = 2 in {
  def : WriteRes<WriteFMul32, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFMA32, [CoreLabJuniperFMISC]>;
}

let Latency = 4 in {
  def : WriteRes<WriteFMul64, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFMA64, [CoreLabJuniperFMISC]>;
}

// FP division
let Latency = 12 in {
  def : WriteRes<WriteFDiv32, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFSqrt32, [CoreLabJuniperFMISC]>;
}

let Latency = 16 in {
  def : WriteRes<WriteFDiv64, [CoreLabJuniperFMISC]>;
  def : WriteRes<WriteFSqrt64, [CoreLabJuniperFMISC]>;
}

// Others
let Latency = 1 in {
  def : WriteRes<WriteCSR, [CoreLabJuniperALU]>;
  def : WriteRes<WriteNop, []>;
}

def : InstRW<[WriteIALU], (instrs COPY)>;

// Bypass and advance

class CoreLabJuniperLoadToALUBypass<SchedRead read>
    : ReadAdvance<read, 1, [WriteLDB, WriteLDH, WriteLDW, WriteLDD, WriteAtomicW, WriteAtomicD, WriteAtomicLDW, WriteAtomicLDD]>;

def : ReadAdvance<ReadJmp, 0>;
def : ReadAdvance<ReadJalr, 0>;
def : ReadAdvance<ReadCSR, 0>;
def : ReadAdvance<ReadStoreData, 0>;
def : ReadAdvance<ReadMemBase, 0>;
def : CoreLabJuniperLoadToALUBypass<ReadIALU>;
def : CoreLabJuniperLoadToALUBypass<ReadIALU32>;
def : CoreLabJuniperLoadToALUBypass<ReadShiftImm>;
def : CoreLabJuniperLoadToALUBypass<ReadShiftImm32>;
def : CoreLabJuniperLoadToALUBypass<ReadShiftReg>;
def : CoreLabJuniperLoadToALUBypass<ReadShiftReg32>;
def : ReadAdvance<ReadIDiv, 0>;
def : ReadAdvance<ReadIDiv32, 0>;
def : ReadAdvance<ReadIRem, 0>;
def : ReadAdvance<ReadIRem32, 0>;
def : ReadAdvance<ReadIMul, 0>;
def : ReadAdvance<ReadIMul32, 0>;
def : ReadAdvance<ReadIMinMax, 0>;
def : ReadAdvance<ReadAtomicWA, 0>;
def : ReadAdvance<ReadAtomicWD, 0>;
def : ReadAdvance<ReadAtomicDA, 0>;
def : ReadAdvance<ReadAtomicDD, 0>;
def : ReadAdvance<ReadAtomicLDW, 0>;
def : ReadAdvance<ReadAtomicLDD, 0>;
def : ReadAdvance<ReadAtomicSTW, 0>;
def : ReadAdvance<ReadAtomicSTD, 0>;
def : ReadAdvance<ReadFStoreData, 0>;
def : ReadAdvance<ReadFMemBase, 0>;
def : ReadAdvance<ReadFAdd32, 0>;
def : ReadAdvance<ReadFAdd64, 0>;
def : ReadAdvance<ReadFMul32, 0>;
def : ReadAdvance<ReadFMul64, 0>;
def : ReadAdvance<ReadFMA32, 0>;
def : ReadAdvance<ReadFMA32Addend, 2>;
def : ReadAdvance<ReadFMA64, 0>;
def : ReadAdvance<ReadFMA64Addend, 2>;
def : ReadAdvance<ReadFDiv32, 0>;
def : ReadAdvance<ReadFDiv64, 0>;
def : ReadAdvance<ReadFSqrt32, 0>;
def : ReadAdvance<ReadFSqrt64, 0>;
def : ReadAdvance<ReadFCmp32, 0>;
def : ReadAdvance<ReadFCmp64, 0>;
def : ReadAdvance<ReadFSGNJ32, 0>;
def : ReadAdvance<ReadFSGNJ64, 0>;
def : ReadAdvance<ReadFMinMax32, 0>;
def : ReadAdvance<ReadFMinMax64, 0>;
def : ReadAdvance<ReadFCvtF32ToI32, 0>;
def : ReadAdvance<ReadFCvtF32ToI64, 0>;
def : ReadAdvance<ReadFCvtF64ToI32, 0>;
def : ReadAdvance<ReadFCvtF64ToI64, 0>;
def : ReadAdvance<ReadFCvtI32ToF32, 0>;
def : ReadAdvance<ReadFCvtI32ToF64, 0>;
def : ReadAdvance<ReadFCvtI64ToF32, 0>;
def : ReadAdvance<ReadFCvtI64ToF64, 0>;
def : ReadAdvance<ReadFCvtF32ToF64, 0>;
def : ReadAdvance<ReadFCvtF64ToF32, 0>;
def : ReadAdvance<ReadFCvtF32ToF16, 0>;
def : ReadAdvance<ReadFCvtF16ToF64, 0>;
def : ReadAdvance<ReadFCvtF64ToF16, 0>;
def : ReadAdvance<ReadFCvtF16ToF32, 0>;
def : ReadAdvance<ReadFMovF32ToI32, 0>;
def : ReadAdvance<ReadFMovI32ToF32, 0>;
def : ReadAdvance<ReadFMovF64ToI64, 0>;
def : ReadAdvance<ReadFMovI64ToF64, 0>;
def : ReadAdvance<ReadFMovI16ToF16, 0>;
def : ReadAdvance<ReadFMovF16ToI16, 0>;
def : ReadAdvance<ReadFClass32, 0>;
def : ReadAdvance<ReadFClass64, 0>;

// Zb*
// Zba
def : CoreLabJuniperLoadToALUBypass<ReadSHXADD>;
def : CoreLabJuniperLoadToALUBypass<ReadSHXADD32>;
// Zbb
def : CoreLabJuniperLoadToALUBypass<ReadRotateImm>;
def : CoreLabJuniperLoadToALUBypass<ReadRotateImm32>;
def : CoreLabJuniperLoadToALUBypass<ReadRotateReg>;
def : CoreLabJuniperLoadToALUBypass<ReadRotateReg32>;
def : ReadAdvance<ReadCLZ, 0>;
def : ReadAdvance<ReadCLZ32, 0>;
def : ReadAdvance<ReadCTZ, 0>;
def : ReadAdvance<ReadCTZ32, 0>;
def : ReadAdvance<ReadCPOP, 0>;
def : ReadAdvance<ReadCPOP32, 0>;
def : CoreLabJuniperLoadToALUBypass<ReadORCB>;
def : CoreLabJuniperLoadToALUBypass<ReadREV8>;
// Zbkc
def : ReadAdvance<ReadCLMUL, 0>;
// Zbs
def : CoreLabJuniperLoadToALUBypass<ReadSingleBit>;
def : CoreLabJuniperLoadToALUBypass<ReadSingleBitImm>;
// Zbkb
def : CoreLabJuniperLoadToALUBypass<ReadBREV8>;
def : CoreLabJuniperLoadToALUBypass<ReadPACK>;
def : CoreLabJuniperLoadToALUBypass<ReadPACK32>;
def : CoreLabJuniperLoadToALUBypass<ReadZIP>;
// Zbkx
def : ReadAdvance<ReadXPERM, 0>;

//===----------------------------------------------------------------------===//
// Unsupported extensions
defm : UnsupportedSchedV;
defm : UnsupportedSchedZfa;
defm : UnsupportedSchedZfh;
defm : UnsupportedSchedSFB;
defm : UnsupportedSchedZabha;
defm : UnsupportedSchedXsfvcp;
defm : UnsupportedSchedZvk;
}
