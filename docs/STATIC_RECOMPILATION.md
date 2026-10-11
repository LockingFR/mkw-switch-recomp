# Static recompilation

## Why not an emulator?

An emulator decodes and executes (or JIT-compiles) guest instructions while the game runs.
Static recompilation does most of that work **ahead of time**: the game's PowerPC code is
translated function by function into C++ and compiled by a normal optimising compiler for the
Switch's ARM CPU. The translated game code is therefore not decoded or JIT-compiled at run time,
which matters on a platform where generating executable code at run time is restricted for
homebrew.

The trade-off: the code the game can execute has to be identified beforehand, and the runtime
has to reproduce closely the hardware environment that code expects.

## How the translation works (overview)

1. **Discovery** — functions are identified in `main.dol` and in the dynamically linked module
   `StaticR.rel`, including targets reached through function pointers and virtual calls.
2. **Translation** — each PowerPC instruction becomes equivalent C++ operating on an explicit
   guest CPU context: 32 general-purpose registers, 32 floating-point registers with
   paired-single halves, condition and fixed-point exception registers, FPSCR and the
   quantisation registers used by paired-single loads and stores.
3. **Calls** — direct calls become C++ calls; indirect calls go through a dispatch table keyed
   by guest address. The runtime is designed to stop with a diagnostic on an unknown or null
   target rather than patch the call.
4. **Memory** — guest loads and stores go through helpers that apply big-endian conversion,
   map guest addresses onto host memory and route device registers (MMIO) to the hardware
   models.
5. **Interrupts and time** — the hardware models deliver interrupts at defined points in the
   translated code; the Wii time base is derived from the Switch's system counter with an exact
   integer ratio.

## What makes it hard

- **Exactness of floating point and paired singles** (rounding, flush-to-zero, FPSCR flags,
  quantised loads/stores).
- **Graphics**: the Wii GPU (GX, "Flipper"/"Hollywood") is a fixed-function pipeline with up to
  16 TEV stages, EFB copies used as render-to-texture and an XFB scanned out by the Video
  Interface; the project aims to reproduce this behaviour as faithfully as possible on the Switch
  GPU.
- **Timing**: the game synchronises with video retraces, GPU completion tokens, audio DMA and
  IOS replies; these have to be modelled correctly for the game to run at its normal speed.
- **Performance**: translated code is made correct first; making it fast without changing
  behaviour is the main ongoing effort (see [STATUS](STATUS.md)).

Comparable static-recompilation projects include XenonRecomp (Xbox 360) and
N64Recomp (Nintendo 64). MKW Switch is an independent implementation.
