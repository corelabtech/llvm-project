//==- RISCVSchedCoreLabCypress.td - CoreLab Cypress Scheduling Definitions --*- tablegen -*-=//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//

// CoreLab Cypress machine model for scheduling and other instruction cost heuristics.
def CoreLabCypressModel : SchedMachineModel {
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

// CoreLab Cypress: 1*jmp + 2*alu + 1*mdu + 1*fpu + 2*ld + 1*st
let SchedModel = CoreLabCypressModel in {

// The reservation stations are distributed and grouped as 32-entry or 16-entry smaller ones.
let BufferSize = 0 in {
  def CoreLabCypressJMP : ProcResource<1>;
  def CoreLabCypressALU : ProcResource<2>;
  def CoreLabCypressMDU : ProcResource<1>;
  def CoreLabCypressFMISC : ProcResource<1>;
  def CoreLabCypressLD : ProcResource<2>;
  def CoreLabCypressST : ProcResource<1>;
}

// Branching
let Latency = 1 in {
  def : WriteRes<WriteJmp, [CoreLabCypressJMP]>;
  def : WriteRes<WriteJal, [CoreLabCypressJMP]>;
  def : WriteRes<WriteJalr, [CoreLabCypressJMP]>;
}

// Integer arithmetic and logic
let Latency = 1 in {
  def : WriteRes<WriteIALU, [CoreLabCypressALU]>;
  def : WriteRes<WriteIALU32, [CoreLabCypressALU]>;
  def : WriteRes<WriteShiftImm, [CoreLabCypressALU]>;
  def : WriteRes<WriteShiftImm32, [CoreLabCypressALU]>;
  def : WriteRes<WriteShiftReg, [CoreLabCypressALU]>;
  def : WriteRes<WriteShiftReg32, [CoreLabCypressALU]>;
}

// Integer multiplication
let Latency = 2 in {
  def : WriteRes<WriteIMul, [CoreLabCypressMDU]>;
  def : WriteRes<WriteIMul32, [CoreLabCypressMDU]>;
}

// Integer division
let Latency = 6 in {
  def : WriteRes<WriteIDiv32, [CoreLabCypressMDU]>;
  def : WriteRes<WriteIDiv, [CoreLabCypressMDU]>;
  def : WriteRes<WriteIRem, [CoreLabCypressMDU]>;
  def : WriteRes<WriteIRem32, [CoreLabCypressMDU]>;
}

// Zb*
let Latency = 1 in {
  // Zba
  def : WriteRes<WriteSHXADD, [CoreLabCypressALU]>;
  def : WriteRes<WriteSHXADD32, [CoreLabCypressALU]>;

  // Zbb
  def : WriteRes<WriteRotateImm, [CoreLabCypressALU]>;
  def : WriteRes<WriteRotateImm32, [CoreLabCypressALU]>;
  def : WriteRes<WriteRotateReg, [CoreLabCypressALU]>;
  def : WriteRes<WriteRotateReg32, [CoreLabCypressALU]>;
  def : WriteRes<WriteORCB, [CoreLabCypressALU]>;
  def : WriteRes<WriteREV8, [CoreLabCypressALU]>;

  // Zbkc
  def : WriteRes<WriteCLMUL, [CoreLabCypressMDU]>;

  // Zbkb
  def : WriteRes<WriteBREV8, [CoreLabCypressALU]>;
  def : WriteRes<WritePACK, [CoreLabCypressALU]>;
  def : WriteRes<WritePACK32, [CoreLabCypressALU]>;
  def : WriteRes<WriteZIP, [CoreLabCypressALU]>;

  // Zbs
  def : WriteRes<WriteSingleBit, [CoreLabCypressALU]>;
  def : WriteRes<WriteSingleBitImm, [CoreLabCypressALU]>;
  def : WriteRes<WriteBEXT, [CoreLabCypressALU]>;
  def : WriteRes<WriteBEXTI, [CoreLabCypressALU]>;
}

let Latency = 1 in {
  // Zbb
  def : WriteRes<WriteCLZ, [CoreLabCypressMDU]>;
  def : WriteRes<WriteCLZ32, [CoreLabCypressMDU]>;
  def : WriteRes<WriteCTZ, [CoreLabCypressMDU]>;
  def : WriteRes<WriteCTZ32, [CoreLabCypressMDU]>;
  def : WriteRes<WriteCPOP, [CoreLabCypressMDU]>;
  def : WriteRes<WriteCPOP32, [CoreLabCypressMDU]>;
  // Zbkx
  def : WriteRes<WriteXPERM, [CoreLabCypressMDU]>;
}

// Memory
let Latency = 2 in {
  def : WriteRes<WriteSTB, [CoreLabCypressST]>;
  def : WriteRes<WriteSTH, [CoreLabCypressST]>;
  def : WriteRes<WriteSTW, [CoreLabCypressST]>;
  def : WriteRes<WriteFST32, [CoreLabCypressST]>;
  def : WriteRes<WriteAtomicSTW, [CoreLabCypressST]>;

  def : WriteRes<WriteLDB, [CoreLabCypressLD]>;
  def : WriteRes<WriteLDH, [CoreLabCypressLD]>;
  def : WriteRes<WriteLDW, [CoreLabCypressLD]>;
  def : WriteRes<WriteAtomicW, [CoreLabCypressLD]>;
  def : WriteRes<WriteAtomicD, [CoreLabCypressLD]>;
  def : WriteRes<WriteAtomicLDW, [CoreLabCypressLD]>;
  def : WriteRes<WriteFLD32, [CoreLabCypressLD]>;
}

let Latency = 3 in {
  def : WriteRes<WriteSTD, [CoreLabCypressST]>;
  def : WriteRes<WriteFST64, [CoreLabCypressST]>;
  def : WriteRes<WriteAtomicSTD, [CoreLabCypressST]>;

  def : WriteRes<WriteLDD, [CoreLabCypressLD]>;
  def : WriteRes<WriteAtomicLDD, [CoreLabCypressLD]>;
  def : WriteRes<WriteFLD64, [CoreLabCypressLD]>;
}

// FP
let Latency = 2 in {
  def : WriteRes<WriteFAdd32, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFSGNJ32, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFMinMax32, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFAdd64, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFSGNJ64, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFMinMax64, [CoreLabCypressFMISC]>;

  def : WriteRes<WriteFCvtI32ToF32, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFCvtI32ToF64, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFCvtI64ToF32, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFCvtI64ToF64, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFCvtF32ToI32, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFCvtF32ToI64, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFCvtF64ToI32, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFCvtF64ToI64, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFCvtF32ToF64, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFCvtF64ToF32, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFCvtF32ToF16, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFCvtF16ToF64, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFCvtF64ToF16, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFCvtF16ToF32, [CoreLabCypressFMISC]>;

  def : WriteRes<WriteFClass32, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFClass64, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFCmp32, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFCmp64, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFMovF32ToI32, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFMovI32ToF32, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFMovF64ToI64, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFMovI64ToF64, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFMovI16ToF16, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFMovF16ToI16, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFLD16, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFST16, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteIMinMax, [CoreLabCypressFMISC]>;
}

// FP multiplication
let Latency = 2 in {
  def : WriteRes<WriteFMul32, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFMA32, [CoreLabCypressFMISC]>;
}

let Latency = 4 in {
  def : WriteRes<WriteFMul64, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFMA64, [CoreLabCypressFMISC]>;
}

// FP division
let Latency = 12 in {
  def : WriteRes<WriteFDiv32, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFSqrt32, [CoreLabCypressFMISC]>;
}

let Latency = 16 in {
  def : WriteRes<WriteFDiv64, [CoreLabCypressFMISC]>;
  def : WriteRes<WriteFSqrt64, [CoreLabCypressFMISC]>;
}

// Others
let Latency = 1 in {
  def : WriteRes<WriteCSR, [CoreLabCypressALU]>;
  def : WriteRes<WriteNop, []>;
}

def : InstRW<[WriteIALU], (instrs COPY)>;

// Bypass and advance

class CoreLabCypressLoadToALUBypass<SchedRead read>
    : ReadAdvance<read, 1, [WriteLDB, WriteLDH, WriteLDW, WriteLDD, WriteAtomicW, WriteAtomicD, WriteAtomicLDW, WriteAtomicLDD]>;

def : ReadAdvance<ReadJmp, 0>;
def : ReadAdvance<ReadJalr, 0>;
def : ReadAdvance<ReadCSR, 0>;
def : ReadAdvance<ReadStoreData, 0>;
def : ReadAdvance<ReadMemBase, 0>;
def : CoreLabCypressLoadToALUBypass<ReadIALU>;
def : CoreLabCypressLoadToALUBypass<ReadIALU32>;
def : CoreLabCypressLoadToALUBypass<ReadShiftImm>;
def : CoreLabCypressLoadToALUBypass<ReadShiftImm32>;
def : CoreLabCypressLoadToALUBypass<ReadShiftReg>;
def : CoreLabCypressLoadToALUBypass<ReadShiftReg32>;
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
def : CoreLabCypressLoadToALUBypass<ReadSHXADD>;
def : CoreLabCypressLoadToALUBypass<ReadSHXADD32>;
// Zbb
def : CoreLabCypressLoadToALUBypass<ReadRotateImm>;
def : CoreLabCypressLoadToALUBypass<ReadRotateImm32>;
def : CoreLabCypressLoadToALUBypass<ReadRotateReg>;
def : CoreLabCypressLoadToALUBypass<ReadRotateReg32>;
def : ReadAdvance<ReadCLZ, 0>;
def : ReadAdvance<ReadCLZ32, 0>;
def : ReadAdvance<ReadCTZ, 0>;
def : ReadAdvance<ReadCTZ32, 0>;
def : ReadAdvance<ReadCPOP, 0>;
def : ReadAdvance<ReadCPOP32, 0>;
def : CoreLabCypressLoadToALUBypass<ReadORCB>;
def : CoreLabCypressLoadToALUBypass<ReadREV8>;
// Zbkc
def : ReadAdvance<ReadCLMUL, 0>;
// Zbs
def : CoreLabCypressLoadToALUBypass<ReadSingleBit>;
def : CoreLabCypressLoadToALUBypass<ReadSingleBitImm>;
// Zbkb
def : CoreLabCypressLoadToALUBypass<ReadBREV8>;
def : CoreLabCypressLoadToALUBypass<ReadPACK>;
def : CoreLabCypressLoadToALUBypass<ReadPACK32>;
def : CoreLabCypressLoadToALUBypass<ReadZIP>;
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
