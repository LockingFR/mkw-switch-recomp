# Development status

*Last reviewed: 2026-10-11. This page summarises; it does not certify the full game.*

## Summary

The port boots on real Switch hardware and races can be played on the tested paths, but it is
**far from complete**: performance is well below the first target, audio is audible but
defective, and many modes have not been verified. **There is no public playable release.**

## What has been observed working (on tested paths only)

| Area | State |
|---|---|
| Boot, menus, character / kart / course selection | Working on the paths tested on hardware. |
| Controls and racing | Working on the courses tested; not every course and mode covered. |
| Rendering | Main scenes render; several texture and effect issues have been fixed; universal correctness not proven. |
| Audio (DSP/AX → Switch audio output) | Audible, but with persistent artefacts; root cause not yet proven. |
| Leaving a race, IOS services | Partially working; some request paths still to verify. |
| Saves, progression, secondary modes | Not yet verified on hardware. |
| Long-session stability | Not yet demonstrated. |

## Performance — measured, not promised

**The 30 FPS and 60 FPS targets have not been reached.**

Two experimental measurements, taken on a Nintendo Switch with the same executable (the
project's internal measurement reference build), during race play:

| Date | Average game FPS | What was averaged | Notes |
|---|---|---|---|
| 9 October 2026 | 16.4 | 30 five-second blocks selected because they had more than 300 draw calls per frame (150 s in total, not necessarily consecutive) | individual blocks ranged from about 11 to 24 FPS |
| 10 October 2026 | 19.1 | 30 five-second blocks, same selection rule (150 s in total) | — |

Each figure is an average of the per-block FPS values, weighted by the number of frames in each
block (frame counts estimated from the logged per-block FPS). It is therefore not necessarily the
same as the total number of frames divided by the elapsed time. Blocks below the selection
threshold (for example menus or loading) are not included.

- These figures describe **those two runs only**. They are not the game's general performance:
  the course segment, camera, number of effects and console mode (docked or handheld) were not
  controlled or recorded, and the two runs had different rendering loads.
- They are descriptive, not a benchmark and not a before/after comparison of any change.
- In the port, race simulation is currently tied to the rendered frame rate, so races run slower
  than normal. Raising the frame rate is therefore the top priority.

## Current focus

1. Measure a reproducible heavy race segment precisely (CPU active vs waiting, GPU, frame times).
2. Optimise only what that measurement shows to be the limiting stage, with equivalence tests.
3. Then gameplay completeness and stability; audio quality after that.

## Known limitations

- A complete build requires the private core and data generated from your own game copy.
- Audio resampling falls back to linear interpolation where the original coefficients are not
  available; this is a known accuracy limit, not a fix for the current artefacts.
- Experimental performance branches exist and are evaluated one at a time on hardware; none is
  considered adopted until measured.
