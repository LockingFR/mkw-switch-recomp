# Building

**This public repository cannot build MKW Switch on its own, by design.**

A complete build needs three things this repository does not contain:

1. **The private runtime core** — the hardware models, the CPU/ABI layer and the translator.
   It is developed in a separate private repository and is not distributed.
2. **Code generated from your own copy of the game** — the translated game code. It is derived
   from Nintendo's software and is never distributed by this project.
3. **The devkitPro toolchain** (devkitA64, libnx, deko3d, uam), installed from devkitPro.

## What happens if you run `make` here

The top-level `Makefile` looks for the private core. When it is absent, the build stops
immediately with an explicit error naming what is missing. This is a real dependency of the
build — the core provides most of the runtime — not a license check or switch that could be
removed to obtain a working port.

## Why

The project publishes what it can publish safely: its original documentation, design and
results. Game-derived material can never be published, and the runtime core is kept private
for legal-provenance and project-direction reasons explained in [LEGAL.md](../LEGAL.md).

Keeping a component private prevents its distribution; it does not prevent anyone from writing
their own independent implementation.
