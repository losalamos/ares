// RUN: llvm-mc -arch=amdgcn -mcpu=bonaire -show-encoding %s | FileCheck %s --check-prefix=CIVI --check-prefix=CI
// RUN: llvm-mc -arch=amdgcn -mcpu=tonga -show-encoding %s | FileCheck %s --check-prefix=CIVI

// FIXME: These instructions give an 'invalid operand' error on SI and should
// instead be reporting an 'instruction not supported' error.

// XUN: not llvm-mc -arch=amdgcn -mcpu=tonga -show-encoding %s | FileCheck %s --check-prefix=NOVI
// XUN: not llvm-mc -arch=amdgcn -show-encoding %s 2>&1 | FileCheck %s --check-prefix=NOSI
// XUN: not llvm-mc -arch=amdgcn -mcpu=SI -show-encoding %s 2>&1 | FileCheck %s --check-prefix=NOSI

//===----------------------------------------------------------------------===//
// Operands
//===----------------------------------------------------------------------===//

flat_load_dword v1, v[3:4]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_load_dword v1, v[3:4] ; encoding: [0x00,0x00,0x30,0xdc,0x03,0x00,0x00,0x01]

flat_load_dword v1, v[3:4] glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_load_dword v1, v[3:4] glc ; encoding: [0x00,0x00,0x31,0xdc,0x03,0x00,0x00,0x01]

flat_load_dword v1, v[3:4] glc slc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_load_dword v1, v[3:4] glc slc ; encoding: [0x00,0x00,0x33,0xdc,0x03,0x00,0x00,0x01]

flat_load_dword v1, v[3:4] glc tfe
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_load_dword v1, v[3:4] glc tfe ; encoding: [0x00,0x00,0x31,0xdc,0x03,0x00,0x80,0x01]

flat_load_dword v1, v[3:4] glc slc tfe
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_load_dword v1, v[3:4] glc slc tfe ; encoding: [0x00,0x00,0x33,0xdc,0x03,0x00,0x80,0x01]

flat_load_dword v1, v[3:4] glc tfe slc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_load_dword v1, v[3:4] glc slc tfe ; encoding: [0x00,0x00,0x33,0xdc,0x03,0x00,0x80,0x01]

flat_load_dword v1, v[3:4] slc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_load_dword v1, v[3:4] slc ; encoding: [0x00,0x00,0x32,0xdc,0x03,0x00,0x00,0x01]

flat_load_dword v1, v[3:4] slc glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_load_dword v1, v[3:4] glc slc ; encoding: [0x00,0x00,0x33,0xdc,0x03,0x00,0x00,0x01]

flat_load_dword v1, v[3:4] slc tfe
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_load_dword v1, v[3:4] slc tfe ; encoding: [0x00,0x00,0x32,0xdc,0x03,0x00,0x80,0x01]

flat_load_dword v1, v[3:4] slc glc tfe
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_load_dword v1, v[3:4] glc slc tfe ; encoding: [0x00,0x00,0x33,0xdc,0x03,0x00,0x80,0x01]

flat_load_dword v1, v[3:4] slc tfe glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_load_dword v1, v[3:4] glc slc tfe ; encoding: [0x00,0x00,0x33,0xdc,0x03,0x00,0x80,0x01]

flat_load_dword v1, v[3:4] tfe
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_load_dword v1, v[3:4] tfe ; encoding: [0x00,0x00,0x30,0xdc,0x03,0x00,0x80,0x01]

flat_load_dword v1, v[3:4] tfe glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_load_dword v1, v[3:4] glc tfe ; encoding: [0x00,0x00,0x31,0xdc,0x03,0x00,0x80,0x01]

flat_load_dword v1, v[3:4] tfe slc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_load_dword v1, v[3:4] slc tfe ; encoding: [0x00,0x00,0x32,0xdc,0x03,0x00,0x80,0x01]

flat_load_dword v1, v[3:4] tfe glc slc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_load_dword v1, v[3:4] glc slc tfe ; encoding: [0x00,0x00,0x33,0xdc,0x03,0x00,0x80,0x01]

flat_load_dword v1, v[3:4] tfe slc glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_load_dword v1, v[3:4] glc slc tfe ; encoding: [0x00,0x00,0x33,0xdc,0x03,0x00,0x80,0x01]

flat_store_dword v1, v[3:4]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_store_dword v1, v[3:4] ; encoding: [0x00,0x00,0x70,0xdc,0x03,0x01,0x00,0x00]

flat_store_dword v1, v[3:4] glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_store_dword v1, v[3:4] glc ; encoding: [0x00,0x00,0x71,0xdc,0x03,0x01,0x00,0x00]

flat_store_dword v1, v[3:4] glc slc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_store_dword v1, v[3:4] glc slc ; encoding: [0x00,0x00,0x73,0xdc,0x03,0x01,0x00,0x00]

flat_store_dword v1, v[3:4] glc tfe
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_store_dword v1, v[3:4] glc tfe ; encoding: [0x00,0x00,0x71,0xdc,0x03,0x01,0x80,0x00]

flat_store_dword v1, v[3:4] glc slc tfe
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_store_dword v1, v[3:4] glc slc tfe ; encoding: [0x00,0x00,0x73,0xdc,0x03,0x01,0x80,0x00]

flat_store_dword v1, v[3:4] glc tfe slc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_store_dword v1, v[3:4] glc slc tfe ; encoding: [0x00,0x00,0x73,0xdc,0x03,0x01,0x80,0x00]

flat_store_dword v1, v[3:4] slc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_store_dword v1, v[3:4] slc ; encoding: [0x00,0x00,0x72,0xdc,0x03,0x01,0x00,0x00]

flat_store_dword v1, v[3:4] slc glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_store_dword v1, v[3:4] glc slc ; encoding: [0x00,0x00,0x73,0xdc,0x03,0x01,0x00,0x00]

flat_store_dword v1, v[3:4] slc tfe
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_store_dword v1, v[3:4] slc tfe ; encoding: [0x00,0x00,0x72,0xdc,0x03,0x01,0x80,0x00]

flat_store_dword v1, v[3:4] slc glc tfe
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_store_dword v1, v[3:4] glc slc tfe ; encoding: [0x00,0x00,0x73,0xdc,0x03,0x01,0x80,0x00]

flat_store_dword v1, v[3:4] slc tfe glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_store_dword v1, v[3:4] glc slc tfe ; encoding: [0x00,0x00,0x73,0xdc,0x03,0x01,0x80,0x00]

flat_store_dword v1, v[3:4] tfe
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_store_dword v1, v[3:4] tfe ; encoding: [0x00,0x00,0x70,0xdc,0x03,0x01,0x80,0x00]

flat_store_dword v1, v[3:4] tfe glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_store_dword v1, v[3:4] glc tfe ; encoding: [0x00,0x00,0x71,0xdc,0x03,0x01,0x80,0x00]

flat_store_dword v1, v[3:4] tfe slc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_store_dword v1, v[3:4] slc tfe ; encoding: [0x00,0x00,0x72,0xdc,0x03,0x01,0x80,0x00]

flat_store_dword v1, v[3:4] tfe glc slc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_store_dword v1, v[3:4] glc slc tfe ; encoding: [0x00,0x00,0x73,0xdc,0x03,0x01,0x80,0x00]

flat_store_dword v1, v[3:4] tfe slc glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_store_dword v1, v[3:4] glc slc tfe ; encoding: [0x00,0x00,0x73,0xdc,0x03,0x01,0x80,0x00]

// FIXME: For atomic instructions, glc must be placed immediately following
// the data regiser.  These forms aren't currently supported:
// flat_atomic_add v1, v[3:4], v5 slc glc
// flat_atomic_add v1, v[3:4], v5 slc glc tfe
// flat_atomic_add v1, v[3:4], v5 slc tfe glc
// flat_atomic_add v1, v[3:4], v5 tfe glc
// flat_atomic_add v[3:4], v5 tfe glc
// flat_atomic_add v1, v[3:4], v5 tfe glc slc
// flat_atomic_add v1, v[3:4], v5 tfe slc glc

flat_atomic_add v1 v[3:4], v5 glc slc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_add v1, v[3:4], v5 glc slc ; encoding: [0x00,0x00,0xcb,0xdc,0x03,0x05,0x00,0x01]

flat_atomic_add v1 v[3:4], v5 glc tfe
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_add v1, v[3:4], v5 glc tfe ; encoding: [0x00,0x00,0xc9,0xdc,0x03,0x05,0x80,0x01]

flat_atomic_add v1 v[3:4], v5 glc slc tfe
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_add v1, v[3:4], v5 glc slc tfe ; encoding: [0x00,0x00,0xcb,0xdc,0x03,0x05,0x80,0x01]

flat_atomic_add v1 v[3:4], v5 glc tfe slc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_add v1, v[3:4], v5 glc slc tfe ; encoding: [0x00,0x00,0xcb,0xdc,0x03,0x05,0x80,0x01]

flat_atomic_add v[3:4], v5 slc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_add v[3:4], v5 slc ; encoding: [0x00,0x00,0xca,0xdc,0x03,0x05,0x00,0x00]

flat_atomic_add v[3:4], v5 slc tfe
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_add v[3:4], v5 slc tfe ; encoding: [0x00,0x00,0xca,0xdc,0x03,0x05,0x80,0x00]

flat_atomic_add v[3:4], v5 tfe
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_add v[3:4], v5 tfe ; encoding: [0x00,0x00,0xc8,0xdc,0x03,0x05,0x80,0x00]

//===----------------------------------------------------------------------===//
// Instructions
//===----------------------------------------------------------------------===//

flat_load_ubyte v1, v[3:4]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_load_ubyte v1, v[3:4] ; encoding: [0x00,0x00,0x20,0xdc,0x03,0x00,0x00,0x01]

flat_load_sbyte v1, v[3:4]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_load_sbyte v1, v[3:4] ; encoding: [0x00,0x00,0x24,0xdc,0x03,0x00,0x00,0x01]

flat_load_ushort v1, v[3:4]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_load_ushort v1, v[3:4] ; encoding: [0x00,0x00,0x28,0xdc,0x03,0x00,0x00,0x01]

flat_load_sshort v1, v[3:4]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_load_sshort v1, v[3:4] ; encoding: [0x00,0x00,0x2c,0xdc,0x03,0x00,0x00,0x01]

flat_load_dword v1, v[3:4]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_load_dword v1, v[3:4] ; encoding: [0x00,0x00,0x30,0xdc,0x03,0x00,0x00,0x01]

flat_load_dwordx2 v[1:2], v[3:4]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_load_dwordx2 v[1:2], v[3:4] ; encoding: [0x00,0x00,0x34,0xdc,0x03,0x00,0x00,0x01]

flat_load_dwordx4 v[5:8], v[3:4]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_load_dwordx4 v[5:8], v[3:4] ; encoding: [0x00,0x00,0x38,0xdc,0x03,0x00,0x00,0x05]

flat_load_dwordx3 v[5:7], v[3:4]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_load_dwordx3 v[5:7], v[3:4] ; encoding: [0x00,0x00,0x3c,0xdc,0x03,0x00,0x00,0x05]

flat_store_byte v1, v[3:4]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_store_byte v1, v[3:4] ; encoding: [0x00,0x00,0x60,0xdc,0x03,0x01,0x00,0x00]

flat_store_short v1, v[3:4]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_store_short v1, v[3:4] ; encoding: [0x00,0x00,0x68,0xdc,0x03,0x01,0x00,0x00]

flat_store_dword v1, v[3:4]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_store_dword v1, v[3:4] ; encoding: [0x00,0x00,0x70,0xdc,0x03,0x01,0x00,0x00]

flat_store_dwordx2 v[1:2], v[3:4]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_store_dwordx2 v[1:2], v[3:4] ; encoding: [0x00,0x00,0x74,0xdc,0x03,0x01,0x00,0x00]

flat_store_dwordx4 v[5:8], v[3:4]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_store_dwordx4 v[5:8], v[3:4] ; encoding: [0x00,0x00,0x78,0xdc,0x03,0x05,0x00,0x00]

flat_store_dwordx3 v[5:7], v[3:4]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_store_dwordx3 v[5:7], v[3:4] ; encoding: [0x00,0x00,0x7c,0xdc,0x03,0x05,0x00,0x00]

flat_atomic_swap v[3:4], v5
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_swap v[3:4], v5 ; encoding: [0x00,0x00,0xc0,0xdc,0x03,0x05,0x00,0x00]

flat_atomic_swap v1, v[3:4], v5 glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_swap v1, v[3:4], v5 glc ; encoding: [0x00,0x00,0xc1,0xdc,0x03,0x05,0x00,0x01]

flat_atomic_cmpswap v[3:4], v[5:6]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_cmpswap v[3:4], v[5:6] ; encoding: [0x00,0x00,0xc4,0xdc,0x03,0x05,0x00,0x00]

flat_atomic_cmpswap v1, v[3:4], v[5:6] glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_cmpswap v1, v[3:4], v[5:6] glc ; encoding: [0x00,0x00,0xc5,0xdc,0x03,0x05,0x00,0x01]

flat_atomic_add v[3:4], v5
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_add v[3:4], v5 ; encoding: [0x00,0x00,0xc8,0xdc,0x03,0x05,0x00,0x00]

flat_atomic_add v1, v[3:4], v5 glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_add v1, v[3:4], v5 glc ; encoding: [0x00,0x00,0xc9,0xdc,0x03,0x05,0x00,0x01]

flat_atomic_sub v[3:4], v5
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_sub v[3:4], v5 ; encoding: [0x00,0x00,0xcc,0xdc,0x03,0x05,0x00,0x00]

flat_atomic_sub v1, v[3:4], v5 glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_sub v1, v[3:4], v5 glc ; encoding: [0x00,0x00,0xcd,0xdc,0x03,0x05,0x00,0x01]

flat_atomic_smin v[3:4], v5
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_smin v[3:4], v5 ; encoding: [0x00,0x00,0xd4,0xdc,0x03,0x05,0x00,0x00]

flat_atomic_smin v1, v[3:4], v5 glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_smin v1, v[3:4], v5 glc ; encoding: [0x00,0x00,0xd5,0xdc,0x03,0x05,0x00,0x01]

flat_atomic_umin v[3:4], v5
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_umin v[3:4], v5 ; encoding: [0x00,0x00,0xd8,0xdc,0x03,0x05,0x00,0x00]

flat_atomic_umin v1, v[3:4], v5 glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_umin v1, v[3:4], v5 glc ; encoding: [0x00,0x00,0xd9,0xdc,0x03,0x05,0x00,0x01]

flat_atomic_smax v[3:4], v5
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_smax v[3:4], v5 ; encoding: [0x00,0x00,0xdc,0xdc,0x03,0x05,0x00,0x00]

flat_atomic_smax v1, v[3:4], v5 glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_smax v1, v[3:4], v5 glc ; encoding: [0x00,0x00,0xdd,0xdc,0x03,0x05,0x00,0x01]

flat_atomic_umax v[3:4], v5
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_umax v[3:4], v5 ; encoding: [0x00,0x00,0xe0,0xdc,0x03,0x05,0x00,0x00]

flat_atomic_umax v1, v[3:4], v5 glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_umax v1, v[3:4], v5 glc ; encoding: [0x00,0x00,0xe1,0xdc,0x03,0x05,0x00,0x01]

flat_atomic_and v[3:4], v5
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_and v[3:4], v5 ; encoding: [0x00,0x00,0xe4,0xdc,0x03,0x05,0x00,0x00]

flat_atomic_and v1, v[3:4], v5 glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_and v1, v[3:4], v5 glc ; encoding: [0x00,0x00,0xe5,0xdc,0x03,0x05,0x00,0x01]

flat_atomic_or v[3:4], v5
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_or v[3:4], v5 ; encoding: [0x00,0x00,0xe8,0xdc,0x03,0x05,0x00,0x00]

flat_atomic_or v1, v[3:4], v5 glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_or v1, v[3:4], v5 glc ; encoding: [0x00,0x00,0xe9,0xdc,0x03,0x05,0x00,0x01]

flat_atomic_xor v[3:4], v5
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_xor v[3:4], v5 ; encoding: [0x00,0x00,0xec,0xdc,0x03,0x05,0x00,0x00]

flat_atomic_xor v1, v[3:4], v5 glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_xor v1, v[3:4], v5 glc ; encoding: [0x00,0x00,0xed,0xdc,0x03,0x05,0x00,0x01]

flat_atomic_inc v[3:4], v5
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_inc v[3:4], v5 ; encoding: [0x00,0x00,0xf0,0xdc,0x03,0x05,0x00,0x00]

flat_atomic_inc v1, v[3:4], v5 glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_inc v1, v[3:4], v5 glc ; encoding: [0x00,0x00,0xf1,0xdc,0x03,0x05,0x00,0x01]

flat_atomic_dec v[3:4], v5
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_dec v[3:4], v5 ; encoding: [0x00,0x00,0xf4,0xdc,0x03,0x05,0x00,0x00]

flat_atomic_dec v1, v[3:4], v5 glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_dec v1, v[3:4], v5 glc ; encoding: [0x00,0x00,0xf5,0xdc,0x03,0x05,0x00,0x01]

flat_atomic_swap_x2 v[3:4], v[5:6]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_swap_x2 v[3:4], v[5:6] ; encoding: [0x00,0x00,0x40,0xdd,0x03,0x05,0x00,0x00]

flat_atomic_swap_x2 v[1:2], v[3:4], v[5:6] glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_swap_x2 v[1:2], v[3:4], v[5:6] glc ; encoding: [0x00,0x00,0x41,0xdd,0x03,0x05,0x00,0x01]

flat_atomic_cmpswap_x2 v[3:4], v[5:8]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_cmpswap_x2 v[3:4], v[5:8] ; encoding: [0x00,0x00,0x44,0xdd,0x03,0x05,0x00,0x00]

flat_atomic_cmpswap_x2 v[1:2], v[3:4], v[5:8] glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_cmpswap_x2 v[1:2], v[3:4], v[5:8] glc ; encoding: [0x00,0x00,0x45,0xdd,0x03,0x05,0x00,0x01]

flat_atomic_add_x2 v[3:4], v[5:6]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_add_x2 v[3:4], v[5:6] ; encoding: [0x00,0x00,0x48,0xdd,0x03,0x05,0x00,0x00]

flat_atomic_add_x2 v[1:2], v[3:4], v[5:6] glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_add_x2 v[1:2], v[3:4], v[5:6] glc ; encoding: [0x00,0x00,0x49,0xdd,0x03,0x05,0x00,0x01]

flat_atomic_sub_x2 v[3:4], v[5:6]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_sub_x2 v[3:4], v[5:6] ; encoding: [0x00,0x00,0x4c,0xdd,0x03,0x05,0x00,0x00]

flat_atomic_sub_x2 v[1:2], v[3:4], v[5:6] glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_sub_x2 v[1:2], v[3:4], v[5:6] glc ; encoding: [0x00,0x00,0x4d,0xdd,0x03,0x05,0x00,0x01]

flat_atomic_smin_x2 v[3:4], v[5:6]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_smin_x2 v[3:4], v[5:6] ; encoding: [0x00,0x00,0x54,0xdd,0x03,0x05,0x00,0x00]

flat_atomic_smin_x2 v[1:2], v[3:4], v[5:6] glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_smin_x2 v[1:2], v[3:4], v[5:6] glc ; encoding: [0x00,0x00,0x55,0xdd,0x03,0x05,0x00,0x01]

flat_atomic_umin_x2 v[3:4], v[5:6]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_umin_x2 v[3:4], v[5:6] ; encoding: [0x00,0x00,0x58,0xdd,0x03,0x05,0x00,0x00]

flat_atomic_umin_x2 v[1:2], v[3:4], v[5:6] glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_umin_x2 v[1:2], v[3:4], v[5:6] glc ; encoding: [0x00,0x00,0x59,0xdd,0x03,0x05,0x00,0x01] 

flat_atomic_smax_x2 v[3:4], v[5:6]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_smax_x2 v[3:4], v[5:6] ; encoding: [0x00,0x00,0x5c,0xdd,0x03,0x05,0x00,0x00]

flat_atomic_smax_x2 v[1:2], v[3:4], v[5:6] glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_smax_x2 v[1:2], v[3:4], v[5:6] glc ; encoding: [0x00,0x00,0x5d,0xdd,0x03,0x05,0x00,0x01]

flat_atomic_umax_x2 v[3:4], v[5:6]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_umax_x2 v[3:4], v[5:6] ; encoding: [0x00,0x00,0x60,0xdd,0x03,0x05,0x00,0x00]

flat_atomic_umax_x2 v[1:2], v[3:4], v[5:6] glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_umax_x2 v[1:2], v[3:4], v[5:6] glc ; encoding: [0x00,0x00,0x61,0xdd,0x03,0x05,0x00,0x01]

flat_atomic_and_x2 v[3:4], v[5:6]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_and_x2 v[3:4], v[5:6] ; encoding: [0x00,0x00,0x64,0xdd,0x03,0x05,0x00,0x00]

flat_atomic_and_x2 v[1:2], v[3:4], v[5:6] glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_and_x2 v[1:2], v[3:4], v[5:6] glc ; encoding: [0x00,0x00,0x65,0xdd,0x03,0x05,0x00,0x01]

flat_atomic_or_x2 v[3:4], v[5:6]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_or_x2 v[3:4], v[5:6] ; encoding: [0x00,0x00,0x68,0xdd,0x03,0x05,0x00,0x00]

flat_atomic_or_x2 v[1:2], v[3:4], v[5:6] glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_or_x2 v[1:2], v[3:4], v[5:6] glc ; encoding: [0x00,0x00,0x69,0xdd,0x03,0x05,0x00,0x01]

flat_atomic_xor_x2 v[3:4], v[5:6]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_xor_x2 v[3:4], v[5:6] ; encoding: [0x00,0x00,0x6c,0xdd,0x03,0x05,0x00,0x00]

flat_atomic_xor_x2 v[1:2], v[3:4], v[5:6] glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_xor_x2 v[1:2], v[3:4], v[5:6] glc ; encoding: [0x00,0x00,0x6d,0xdd,0x03,0x05,0x00,0x01]

flat_atomic_inc_x2 v[3:4], v[5:6]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_inc_x2 v[3:4], v[5:6] ; encoding: [0x00,0x00,0x70,0xdd,0x03,0x05,0x00,0x00]

flat_atomic_inc_x2 v[1:2], v[3:4], v[5:6] glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_inc_x2 v[1:2], v[3:4], v[5:6] glc ; encoding: [0x00,0x00,0x71,0xdd,0x03,0x05,0x00,0x01]

flat_atomic_dec_x2 v[3:4], v[5:6]
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_dec_x2 v[3:4], v[5:6] ; encoding: [0x00,0x00,0x74,0xdd,0x03,0x05,0x00,0x00]

flat_atomic_dec_x2 v[1:2], v[3:4], v[5:6] glc
// NOSI: error: instruction not supported on this GPU
// CIVI: flat_atomic_dec_x2 v[1:2], v[3:4], v[5:6] glc ; encoding: [0x00,0x00,0x75,0xdd,0x03,0x05,0x00,0x01]

flat_atomic_fcmpswap_x2 v[3:4], v[5:8]
// NOSI: error: instruction not supported on this GPU
// CI: flat_atomic_fcmpswap_x2 v[3:4], v[5:8] ; encoding: [0x00,0x00,0x78,0xdd,0x03,0x05,0x00,0x00]
// NOVI: error: instruction not supported on this GPU

flat_atomic_fcmpswap_x2 v[1:2], v[3:4], v[5:8] glc
// NOSI: error: instruction not supported on this GPU
// CI: flat_atomic_fcmpswap_x2 v[1:2], v[3:4], v[5:8] glc ; encoding: [0x00,0x00,0x79,0xdd,0x03,0x05,0x00,0x01]
// NOVI: error: instruction not supported on this GPU

flat_atomic_fmin_x2 v[3:4], v[5:6]
// NOSI: error: instruction not supported on this GPU
// CI: flat_atomic_fmin_x2 v[3:4], v[5:6] ; encoding: [0x00,0x00,0x7c,0xdd,0x03,0x05,0x00,0x00]
// NOVI: error: instruction not supported on this GPU

flat_atomic_fmin_x2 v[1:2], v[3:4], v[5:6] glc
// NOSI: error: instruction not supported on this GPU
// CI: flat_atomic_fmin_x2 v[1:2], v[3:4], v[5:6] glc ; encoding: [0x00,0x00,0x7d,0xdd,0x03,0x05,0x00,0x01]
// NOVI: error: instruction not supported on this GPU

flat_atomic_fmax_x2 v[3:4], v[5:6]
// NOSI: error: instruction not supported on this GPU
// CI: flat_atomic_fmax_x2 v[3:4], v[5:6] ; encoding: [0x00,0x00,0x80,0xdd,0x03,0x05,0x00,0x00]
// NOVI: error: instruction not supported on this GPU

flat_atomic_fmax_x2 v[1:2], v[3:4], v[5:6] glc
// NOSI: error: instruction not supported on this GPU
// CI: flat_atomic_fmax_x2 v[1:2], v[3:4], v[5:6] glc ; encoding: [0x00,0x00,0x81,0xdd,0x03,0x05,0x00,0x01]
// NOVI: error: instruction not supported on this GPU