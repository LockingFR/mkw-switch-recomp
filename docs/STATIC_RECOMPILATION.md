# Static recompilation

## Why not an emulator?

An emulator decodes and executes (or JIT-compiles) guest instructions while the game runs.
Static recompilation does that work **once, ahead of time**: every function of the game's
PowerPC code is translated into C++ and compiled by a normal optimising compiler for the
Switch's ARM CPU. At run time there is no instruction decoding and no JIT, which matters on a
platform where homebrew cannot generate executable code freely.

The trade-off: everything the game can execute must be found and translated beforehand, and the
runtime must reproduce precisely the hardware environment that code expects.

## How the translation works

1. **Discovery** — functions are identified in `main.dol` and in the dynamically linked module
   `StaticR.rel`, including targets reached through function pointers and virtual calls.
2. **Translation** — each PowerPC instruction becomes equivalent C++ operating on an explicit
   guest CPU context: 32 general-purpose registers, 32 floating-point registers with
   paired-single halves, condition and fixed-point exception registers, FPSCR and the
   quantisation registers used by paired-single loads and stores.
3. **Calls** — direct calls become C++ calls; indirect calls go through a dispatch table keyed
   by guest address. A call to an unknown or null target stops with a diagnostic rather than
   being patched.
4. **Memory** — guest loads and stores go through helpers that apply big-endian conversion,
   map guest addresses onto host memory and route device registers (MMIO) to the hardware
   models.
5. **Interrupts and time** — the hardware models deliver interrupts at well-defined points;
   the Wii time base is derived from the Switch's system counter with an exact integer ratio.

## What makes it hard

- **Exactness of floating point and paired singles** (rounding, flush-to-zero, FPSCR flags,
  quantised loads/stores).
- **Graphics**: the Wii GPU (GX/"Flipper"/"Hollywood") is a fixed-function pipeline with
  16 TEV stages, EFB copies used as render-to-texture and an XFB scanned out by the Video
  Interface; all of it is reproduced on a modern GPU.
- **Timing**: the game synchronises with video retraces, GPU completion tokens, audio DMA and
  IOS replies; getting these right is required for correct game speed.
- **Performance**: translated code is correct first; making it fast without changing behaviour
  is the main ongoing effort (see [STATUS](STATUS.md)).

Projects in the same family that inspired the approach include XenonRecomp (Xbox 360) and
N64Recomp (Nintendo 64). MKW Switch is an independent implementation.
