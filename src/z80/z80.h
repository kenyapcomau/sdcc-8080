/** @file z80/z80.h
    Common definitions between the z80 and gbz80 parts.
*/
#include "common.h"
#include "ralloc.h"
#include "gen.h"
#include "peep.h"
#include "support.h"

typedef enum
  {
    SUB_Z80,
    SUB_Z180,
    SUB_R2K,
    SUB_R3KA,
    SUB_GBZ80,
    SUB_TLCS90,
    SUB_EZ80_Z80,
    SUB_I80,
  }
Z80_SUB_PORT;

typedef struct
  {
    Z80_SUB_PORT sub;
    int calleeSavesBC;
    int port_mode;
    int port_back;
    int reserveIY;
    int noOmitFramePtr;
  }
Z80_OPTS;

extern Z80_OPTS z80_opts;

#define IS_Z80 (z80_opts.sub == SUB_Z80)
#define IS_Z180 (z80_opts.sub == SUB_Z180)
#define IS_R2K (z80_opts.sub == SUB_R2K)
#define IS_R3KA (z80_opts.sub == SUB_R3KA)
#define IS_RAB (IS_R2K || IS_R3KA)
#define IS_GB (z80_opts.sub == SUB_GBZ80)
#define IS_TLCS90 (z80_opts.sub == SUB_TLCS90)
#define IS_EZ80_Z80 (z80_opts.sub == SUB_EZ80_Z80)
#define IS_I80 (z80_opts.sub == SUB_I80)
#define IS_GB_I80 (IS_GB||IS_I80)

#define IY_RESERVED (z80_opts.reserveIY)

#define OPTRALLOC_HL (!IS_GB)
#define OPTRALLOC_IY !(IY_RESERVED || IS_GB_I80)

enum
  {
    ACCUSE_A = 1,
    ACCUSE_SCRATCH,
    ACCUSE_IY
  };

