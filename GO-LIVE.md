**English** | [Tiếng Việt](GO-LIVE.vi.md)

# Going live with the online temple, step by step

Three things run at the same time during a live:

```
TikTok LIVE ──(gifts, likes, chat)──> TikFinity Desktop ──ws://127.0.0.1:21213──> Temple (run.bat, port 3939)
                                      (or the direct connection, no TikFinity)              │
LIVE Studio / OBS <───────────── overlay picture http://localhost:3939/overlay ─────────────┘
```

The control panel and the overlay are in Vietnamese. Button and tab names are given below as they appear on screen, with the English in brackets.

## Choose a route

Before going live, decide **what puts the temple picture on air** and **what the account is allowed to do**.

| Route | Needs | Start each live | Follow |
|---|---|---|---|
| **A. LIVE Studio captures a window** | An account that can use LIVE Studio | `run.bat` + `overlay.bat` + Studio | Step 2A |
| **B. OBS → Virtual Camera → LIVE Studio** (smoothest, recommended) | An account that can use LIVE Studio, and OBS | `run.bat` + OBS + Studio | Step 2B |
| **C. OBS streams with a stream key** | An account with a stream key | `run.bat` + OBS | Step 2B, part C |

If the account cannot use Studio yet (it shows "Không có quyền truy cập", *No access*), do the unlock session below first. In every route `run.bat` must keep running for the whole live.

## 0. What you need

| Item | Notes |
|---|---|
| A TikTok account **with LIVE Studio access** | The top-right corner of LIVE Studio must **no longer** show "Không có quyền truy cập" (*No access*). New accounts: **go live from the phone once for about 25 minutes**, then TikTok unlocks Studio (see "Unlock session" below) |
| TikTok LIVE Studio | Installed (routes A and B) |
| OBS Studio | Routes B and C: download from obsproject.com |
| TikFinity Desktop (recommended) | Windows version from the TikFinity website (tikfinity.zerody.one). More stable than the direct connection |
| The kit at `..\tiktok-live-kit` | Already cloned; `run.bat` finds it |

## Unlock session: a 25-minute phone live (once, for a new account)

Use this session to test the **data link**: gifts, likes and chat from the phone live still reach the temple on the computer.

1. Computer: run `run.bat` (step 1) and open the overlay `http://localhost:3939/overlay` to watch the temple react.
2. Phone: open TikTok, tap **+** → **LIVE**, set a title, then **Go LIVE**. Stay on for about 25 minutes.
3. Computer: connect the data as in step 3 (TikFinity signed in to the channel's account, or **Trực tiếp** (*Direct*) with the channel name).
4. Ask a friend to type «xin xăm» (*draw a fortune*) and «lạy Phật» (*bow to the Buddha*) in chat, send likes and a small gift: on the computer, people should walk into the temple, bow, draw fortunes and offer incense.
5. After the session, reopen LIVE Studio: once "Không có quyền truy cập" is gone, Studio is ready.

To let viewers see the temple during the phone session, point the phone camera at the computer screen showing the overlay (a stopgap; the picture is not as good as Studio).

### Phone streams the temple screen (computer on wired network, phone without mobile data)

1. Computer: **Settings → Network & internet → Mobile hotspot**, share from **Ethernet** over **Wi-Fi**, turn it on. Join that Wi-Fi from the phone (turn off USB tethering if it is on).
2. In `config.json`, add the hotspot address to `host`: `"host": "127.0.0.1,192.168.137.1"` (opens only the hotspot network; the wired network stays closed). Restart `run.bat`.
3. On the phone, open Chrome at `http://192.168.137.1:3939/overlay` and tap once to enable sound. If Windows asks whether Node.js may use the network, allow it.
4. TikTok: **+ → LIVE → Mobile gaming / screen share** → go live, then switch to Chrome. In the control panel on the computer, click **Kết nối** (*Connect*) with **Trực tiếp** (*Direct*) and the channel name.
5. After the live: turn off the hotspot and remove `192.168.137.1` from `host` if you no longer need it.

## 1. Open the temple

1. Run `run.bat` in this folder.
2. A black window titled **"Chua ao - TikTok Live"** appears: that is the server. **Leave it open** for the whole live.
3. The browser opens the **control panel** at `http://localhost:3939`.

## 2A. Put the temple into LIVE Studio (window capture)

1. Open LIVE Studio and choose the **portrait (9:16)** frame. In the camera setup step just click **Continue**; the temple needs no camera (hide the camera source once you reach the main screen).
2. Run **`overlay.bat`**: it opens the temple in its own portrait window (it does not "sleep" when covered, and plays sound on its own).
3. Studio: **Add source → Window capture**, pick the temple window (chrome.exe, titled "Chùa ảo"). TikTok's **Link** source does not accept local addresses.
4. Stretch the temple source to fill the portrait frame. Do not minimise the temple window; leaving it behind other windows is fine.
5. Bells, wooden fish and voice: Studio picks up computer audio in its audio settings. Click an effect button in the control panel to test.
6. Studio's **widgets** (goals, leaderboards…) are not needed: the temple already has them, and adding them would overlap.

## 2B. Put the temple into OBS (set up once, OBS remembers)

OBS draws the temple itself through a Browser source, so the picture is smoother than window capture, and **`overlay.bat` is not needed**.

1. OBS → **Settings → Video**: base and output resolution **1080 × 1920**, **30 FPS**.
2. **Sources → + → Browser**: URL `http://localhost:3939/overlay`, width **1080**, height **1920**, tick **Control audio via OBS**. Right-click the source → **Interact**, click the temple once to enable sound.
3. Bells, wooden fish and voice: right-click the source → **Advanced Audio Properties** → set Audio Monitoring to **Monitor and Output**.
4. **Route B, through LIVE Studio**: in OBS click **Start Virtual Camera**. Open LIVE Studio, **portrait (9:16)** frame, **Add source → Camera → OBS Virtual Camera**, stretch it to fill the frame. The virtual camera carries only the picture; sound goes through the computer speakers, so enable computer audio capture in Studio's audio settings.
5. **Route C, with a stream key**: OBS → **Settings → Stream → Custom**, paste the server URL and stream key from TikTok, then **Start Streaming**. Studio is not needed and sound goes straight through OBS (step 3 is optional).
6. Studio's **widgets** are not needed; the temple already has them.

Next time: run `run.bat` → open OBS (route B: click **Start Virtual Camera** again) → open Studio. If the temple is white or frozen, right-click the Browser source → **Refresh**.

## 3. Connect gifts, likes and chat

### Option A: through TikFinity (recommended)

1. Open **TikFinity Desktop** and sign in with **the channel's own TikTok account**.
2. If TikFinity's settings have a WebSocket / API option, turn it on with port **21213** (usually on already).
3. Go live first (Studio: **Go LIVE**; route C: OBS **Start Streaming**). TikFinity picks up the live by itself and shows it as connected.
4. In the temple control panel: choose **TikFinity Desktop**, type the channel name (for display), click **Kết nối** (*Connect*). When the status dot turns green, you are done.

### Option B: direct connection (no TikFinity)

1. Go live first (Studio or OBS).
2. In the control panel: choose **Trực tiếp** (*Direct*), type the **channel name** (the part after @, without the @), click **Kết nối** (*Connect*).

Tip: choose **Tự động** (*Auto*) and enter the channel name. The kit uses TikFinity when it is running and falls back to the direct connection otherwise. If the connection drops, the kit retries on its own.

## 4. Test before going live

- Control panel, **Thử nghiệm** (*Test*) tab: click the **effect** buttons (incense, bowing, lotus offering, grand ceremony), the gift buttons and **Đọc thử** (*Test voice*). Drop 60 people to see a busy scene, 400 to check the computer copes.
- **Tự chạy** (*Auto run*) sends virtual visitors into the temple continuously. Remember to click **Tắt** (*Off*) and **Phiên mới** (*New session*, in the **Thống kê** / *Stats* tab) before the real live.
- The **Hướng dẫn** (*Guide*) tab in the control panel summarises the go-live steps.
- To see the areas TikTok covers, open `http://localhost:3939/overlay?safe`.

## 5. Go live

1. Studio: set a title (for example *"Chùa online · gõ «xin xăm» để gieo quẻ"*, "Online temple · type «xin xăm» to draw a fortune"), a topic, then **Go LIVE**. Route C: set the title on TikTok, then click **Start Streaming** in OBS.
2. Connect as in step 3.
3. Watch the control panel: when the "latest events" line is moving, gifts, likes and chat are coming in.

## Common problems

| Symptom | Fix |
|---|---|
| Studio says "Không có quyền truy cập" (*No access*) and cannot go live | The account has no LIVE Studio access yet; it must meet TikTok's requirements first (see the unlock session) |
| Control panel says it cannot find TikFinity at ws://127.0.0.1:21213 | TikFinity is not open, not signed in, or WebSocket is off. Or switch to **Trực tiếp** (*Direct*) |
| Direct connection reports an error | The channel is not live yet, or the channel name is wrong (do not type @) |
| Overlay is silent | Click the overlay once ("Chạm để nghe chuông mõ", *Tap to hear the bells*), and check the volume in the theme settings |
| Voice comes and goes | Microsoft's speech service is unstable; failed lines are skipped and the live keeps running |
| Closed the black window by mistake | Run `run.bat` again, then click Connect again. OBS: right-click the Browser source → Refresh |
| Route B: Studio shows the temple but no sound | The virtual camera carries no sound: set the OBS Browser source to **Monitor and Output** and enable computer audio capture in Studio |
| Route B: Studio does not list "OBS Virtual Camera" | Click **Start Virtual Camera** in OBS before opening Studio, or reopen Studio |
| OBS: the temple is white, no picture | `run.bat` is not running or the URL is wrong. Run `run.bat`, then Refresh the source |
