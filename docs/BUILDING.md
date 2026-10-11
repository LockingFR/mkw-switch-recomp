# Building

**This public repository is not intended to build MKW Switch on its own.**

A complete build needs three things this repository does not contain:

1. **The private runtime core** — the hardware models, the CPU/ABI layer and the translator.
   It is developed in a separate private repository and is not distributed.
2. **Code generated from a legally obtained copy of the game** — the translated game code. It is
   derived from Nintendo's software and this repository does not contain or distribute it.
3. **The devkitPro toolchain** (devkitA64, libnx, deko3d, uam), installed from devkitPro.

## What happens if you run `make` here

The top-level `Makefile` looks for the private core. When it is absent, the build stops
immediately with an explicit error naming what is missing. The core provides most of the
runtime, so this reflects a real dependency of the build rather than a license check.

## Why

The first public release of the project is documentation only. Game-derived material is never
published, and the runtime core is kept private for legal-provenance and project-direction
reasons explained in [LEGAL.md](../LEGAL.md).

Keeping a component private prevents its distribution through this repository; it does not
prevent anyone from writing an independent implementation.
