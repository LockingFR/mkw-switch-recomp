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

- On the current hardware reference build, race segments measured between roughly
  **16 and 19 game frames per second** (heavy scenes, docked). These are descriptive averages,
  not controlled A/B results.
- **Neither 30 FPS in heavy scenes nor 60 FPS has been demonstrated.**
- The game runs at its own speed only when it reaches its frame rate: below it, races run in
  slow motion. Raising the frame rate is therefore the top priority.

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
