<div align="right">

[![English](https://img.shields.io/badge/English-selected-1f6feb)](README.md)
[![Tiếng Việt](https://img.shields.io/badge/Ti%E1%BA%BFng%20Vi%E1%BB%87t-%C4%91%E1%BB%8Dc%20b%E1%BA%A3n%20ti%E1%BA%BFng%20Vi%E1%BB%87t-da3633)](README.vi.md)

</div>

# Online Temple Visit · TikTok LIVE

An online temple visit for TikTok LIVE: viewers walk into a peaceful temple hall, light incense and send wishes for their families, with a Vietnamese voice reading along.
The engine is [TikTok Live Kit](https://github.com/duycuf/tiktok-live-kit). This repo holds only the temple theme.

> The on-screen content, voice lines and detailed guides are in Vietnamese.

## Run

1. Clone the kit **next to** this repo, then run `run.bat` in the kit once to install dependencies:
   ```
   10-code\
     tiktok-live-kit\   (engine)
     tiktok-live-pgd\   (this repo)
   ```
   If the kit lives elsewhere, set `KIT_DIR` to its path.
2. Run `run.bat` here → control panel at http://localhost:3939, overlay at http://localhost:3939/overlay (1080 × 1920).
3. Going live: the smoothest route is **OBS** (Browser source `http://localhost:3939/overlay`) → **Virtual Camera** → TikTok LIVE Studio, or OBS streaming directly if the account has a stream key. Simpler: run `overlay.bat` and let LIVE Studio capture the temple window. Choosing a route, step-by-step setup and connecting TikFinity: [GO-LIVE.md](GO-LIVE.md).

`run.bat` starts the kit's server with three variables: `KIT_THEMES_DIR` (the `themes/` folder here), `KIT_DATA_DIR` (`data/`: edited rules, live sessions, voice cache; not in git) and `KIT_CONFIG` (`config.json`).

## What's inside

| Path | Contents |
|---|---|
| `themes/chua/theme.json` | Gift actions, titles, goals, voice lines, periodic content, sound effects |
| `themes/chua/scene.json` | Temple hall layout measured on the background: horizon, perspective, floor, aisle, 16 honour seats, incense burner, the first two rows always filled |
| `themes/chua/assets/` | Background, characters, background music (`music/`), sound effects (`sfx/`) |
| `themes/chua/docs/` | Prompts used to create the background, the character sheet and other assets |
| `themes/chua/CREDITS.md` | Source and licence of every asset |
| `themes/chua/tools/make-layout.py` | Draws a layout sketch used as a reference when generating the background |
| `brand/` | Channel avatar (a lotus, drawn with `avatar.html`) |
| `GO-LIVE.md` | Step-by-step go-live guide and common problems |
| `overlay.bat` | Opens the temple as a Chrome window for LIVE Studio to capture (calls the kit's `overlay.bat`) |
| `AGENTS.md` | Instructions for AI coding agents working in this repo |

To change the scene, rules or voice, see `docs/THEME.md` in the kit.

## Licence

[MIT](LICENSE): use it, change it and run your own channel freely; just keep the copyright notice. Third-party assets keep their original licences (MIT, CC0); see [CREDITS.md](themes/chua/CREDITS.md) for each file. AI-generated images and music: check that tool's terms before commercial use.
