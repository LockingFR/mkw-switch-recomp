# Roadmap

Goals are listed with the evidence required to call them done. None of the performance targets
below has been reached yet.

## Phase A — Stable reference and functional coverage

Reproducible build and reference, a per-feature evidence matrix (boot, menus, controls, full
race, rendering, music and sound effects, saves, progression, leaving a race, stability).
"Not verified" stays "not verified".

**Done when:** boot, selections, races and exits run without crash on the tested scope;
rendering and controls verified; audio stable on tested scenes; saves actually read back.

## Phase B — Target: about 30 FPS sustained in heavy races (not reached)

Fixed scenes and conditions, paired A/B measurements, and one exact structural optimisation at a
time on the stage that really limits the frame (guest CPU, memory access, code generation, GX
decoding, GPU backend, EFB/XFB or synchronisation).

**Done when:** each retained heavy scene averages at least 30 game FPS with the lower bound of a
95 % confidence interval at or above 30, frame times documented, no change of game speed and no
functional regression, plus a 30-minute session without crash.

## Phase C — Target: towards 60 FPS (not reached)

Rebuild CPU/GX/GPU budgets after phase B; parallelism and memory/cache work compatible with exact
behaviour.

**Done when:** 60 game FPS sustained in documented scenes with unchanged behaviour. If the
hardware cannot reach it, the remaining budget is published instead of skipping frames.

## Phase D — Finish and robustness

More courses, modes, transitions and items; long audio sessions; saves verified after restart;
reproducible build instructions.

## Never on the roadmap

Distributing the game, its files, keys or game-derived code; lowering resolution, removing
effects or altering game speed to report a higher frame rate.
