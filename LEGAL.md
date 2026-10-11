# Rights, licenses and notices

## Project and founder

MKW Switch was created and is led by **[LockingFR](https://github.com/LockingFR)**.

## Original content of this repository

**© 2026 LockingFR and the respective contributors, for their original contributions. All rights
reserved.** No general open-source license is granted for the original content of this
repository. Under GitHub's Terms of Service you may view and fork it on GitHub; any other
reproduction, modification or redistribution requires permission from the rights holders.
Contact [@LockingFR](https://github.com/LockingFR) (see [CONTRIBUTING.md](CONTRIBUTING.md)).

## Nintendo

This project is unofficial and not affiliated with, endorsed or sponsored by Nintendo.
*Mario Kart*, *Mario Kart Wii*, Wii, Nintendo Switch and all related names, marks, characters,
code and assets belong to Nintendo or their respective owners. This repository contains none of
the game's files or code and claims no rights over them.

## Dolphin

The [Dolphin emulator](https://dolphin-emu.org/), at a pinned revision, is the project's
behavioural reference for Wii hardware. Dolphin's source files carry their own license notices:
most are licensed under GPL-2.0-or-later, while some files and bundled third-party components use
other licenses. Any material derived from a Dolphin file is subject to the license of that file,
and would only ever be published under terms compatible with it, with its notices preserved.
This repository contains no Dolphin-derived material.

## Third-party tools and libraries used by the full (private) build

None of them is included in this repository. Each is obtained from its own project, whose license
files are authoritative; the entries below are indicative only.

| Component | Role | License (indicative) |
|---|---|---|
| devkitA64 / GCC | compiler toolchain | GPL-3.0-or-later (the compiler itself) |
| GCC runtime libraries (libgcc, libstdc++) | linked into builds | GPL-3.0-or-later with the GCC Runtime Library Exception |
| newlib (as packaged by devkitPro) | C library, linked into builds | a collection of permissive licenses |
| libnx | Switch homebrew library, linked into builds | see its project (permissive) |
| deko3d | Switch GPU library, linked into builds | see its project (permissive) |
| uam | shader compiler, build-time tool only (not linked into builds) | the LICENSE file of its repository states zlib for uam's own code and MIT for the code it takes from the Mesa 3D graphics library (the devkitPro package metadata lists ISC; the repository's LICENSE file is taken as the reference) |

## Binaries

This public repository does not contain or distribute any build of the port. Distributing a build
would require, among other things, the notices of the components linked into it.

*These notices are informative and are not legal advice.*
