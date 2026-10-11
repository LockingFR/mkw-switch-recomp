# Architecture

This page describes how MKW Switch is organised. It intentionally stays at the level of design:
the runtime core and all game-derived material are private (see
[NOT_DISTRIBUTED.md](NOT_DISTRIBUTED.md)).

## Pipeline: from your disc to a Switch homebrew

```
 Your legally obtained Mario Kart Wii disc (PAL, RMCP01)
        │  extracted locally by the user — never distributed
        ▼
 main.dol + StaticR.rel  (PowerPC "Broadway" machine code)
        │  static translator (offline, ahead of time)
        ▼
 Generated C++  (one C++ function per guest function, plus dispatch tables)
        │  devkitA64 / GCC, together with the runtime
        ▼
 AArch64 homebrew (.nro) running on the Switch with libnx + deko3d
```

The generated C++ is derived from the game and is therefore not published. Game assets
(models, textures, sounds, courses) are read at run time from the user's own disc files.

## Runtime layers

| Layer | Role |
|---|---|
| **CPU / ABI** | Guest register state (GPRs, FPRs, CR, XER, FPSCR, GQRs), PowerPC integer, floating-point and paired-single semantics, big-endian memory access helpers, the calling convention between translated functions. |
| **Guest memory** | The Wii physical/virtual memory map (MEM1, MEM2, locked L1 cache), MMIO routing to device models, bounds and alignment checks. |
| **Wii hardware models** | Video Interface, Serial Interface and the GameCube controller, Processor Interface interrupts, decrementer and time base, DSP + Audio Interface (AX audio mixing), the GX command processor and Pixel Engine. |
| **IOS services** | The Wii's I/O processor services the game uses: file system and NAND (backed by a folder on the SD card), disc interface, ES, KD and others, with their request/reply and interrupt behaviour. |
| **GX frontend** | Consumes the game's graphics FIFO: command parsing, vertex decoding, texture and TEV state, EFB/XFB copies. |
| **Switch GX backend** | Draws with deko3d: a GLSL uber-shader that implements the GX TEV pipeline, optional specialised shaders, EFB copies and XFB encoding in compute shaders, presentation. |
| **Host platform** | Threads (guest CPU, GX consumer, presentation), controller input, SD storage, logging, diagnostics and profiling. |

## Threads

- **Guest CPU thread** — runs the translated game code and services hardware events at the
  points where the real hardware would deliver them.
- **GX thread** — consumes the graphics FIFO in parallel ("dual core" in emulator terms) and
  records GPU work.
- **Presentation thread** — converts the frame the Video Interface scans out and presents it.

## Accuracy principles

- Behaviour reference: the Dolphin emulator at a pinned revision is used as the semantic
  reference for hardware behaviour. See [LEGAL.md](../LEGAL.md) for what this implies.
- No high-level emulation of Nintendo SDK functions: hardware and IOS are modelled at the
  boundary the real console exposes.
- Unexpected situations stop the runtime with an explicit diagnostic ("HardStop") instead of
  silently continuing with invented data.
- Performance work must preserve exact behaviour; every optimisation needs an equivalence
  check and a hardware measurement.

## Public / private boundary

The public repository documents the project. The **private core** contains the runtime,
the translator and everything derived from the game; a full build requires it. The public
build files stop with an explicit error when the core is absent — there is no license key or
toggle to remove. See [BUILDING.md](BUILDING.md).
