# MKW Switch — Mario Kart Wii static recompilation for Nintendo Switch

**MKW Switch** is an independent research project that statically recompiles the PowerPC code
of *Mario Kart Wii* (PAL, RMCP01) into native AArch64 code for the Nintendo Switch, running on a
custom runtime built with [libnx](https://github.com/switchbrew/libnx) and
[deko3d](https://github.com/devkitPro/deko3d).

**Founder and project lead: [LockingFR](https://github.com/LockingFR).**

> **Status: experimental, in active development.** There is no public playable release, and
> none is announced. This repository is the project's public home: it documents the approach,
> the architecture and the real state of the work. It does not contain the game, game-derived
> code, or the private runtime core, and it is not intended to build the port on its own.

## What the project does

- The game's PowerPC code is translated **ahead of time** into C++, then compiled to AArch64.
  No PowerPC CPU is emulated or interpreted at run time.
- A runtime models the Wii hardware the game talks to (memory map, interrupts, video, audio,
  controller, storage, IOS services) and renders the game's GX graphics with deko3d on the
  Switch GPU.
- Behaviour accuracy comes first: the goal is the game behaving as on a Wii, at its normal speed,
  without dropping effects, lowering resolution, or faking frame counters.

Read more:

- [Architecture](docs/ARCHITECTURE.md) — from a Wii disc you own to a Switch homebrew.
- [Static recompilation](docs/STATIC_RECOMPILATION.md) — how the translation works and why.
- [Development status](docs/STATUS.md) — what works, what does not, real measurements.
- [Roadmap](docs/ROADMAP.md) — goals and the criteria used to validate them.
- [Building](docs/BUILDING.md) — why this repository alone cannot build the port.
- [Components not included in this repository](docs/NOT_DISTRIBUTED.md).

## Performance goals (not current results)

The first target is a **sustained 30 FPS in heavy race scenes** at the game's normal speed, then
**60 FPS** if the hardware allows it. **As of October 2026, neither target has been reached.**
See [STATUS](docs/STATUS.md) for the dated experimental measurements and their limits.

## No game files, no keys

This repository does not contain or distribute, and does not accept contributions of, game
files, disc images, NAND dumps, console keys, Nintendo SDK code, game-derived generated code, or
builds of the port. Any use of the project requires your own legally obtained copy of the game.

## Contributing and rights

Please read [CONTRIBUTING.md](CONTRIBUTING.md) and [LEGAL.md](LEGAL.md) first.
No general open-source license is granted for this repository's original content; see
[LEGAL.md](LEGAL.md) for what that means and for third-party notices.

## Not affiliated with Nintendo

This is an unofficial, independent project, not affiliated with or endorsed by Nintendo.
*Mario Kart*, *Mario Kart Wii*, Wii and Nintendo Switch are trademarks of their respective owners.
