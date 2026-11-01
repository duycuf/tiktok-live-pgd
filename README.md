# Chùa ảo · TikTok LIVE

Repo để live kênh chùa ảo: người xem thành Phật tử trong chánh điện, tặng quà để dâng hương, lễ Phật, dâng hoa sen.
Engine là [TikTok Live Kit](https://github.com/duycuf/tiktok-live-kit). Repo này chỉ giữ phần riêng của chùa.

## Chạy

1. Clone kit vào thư mục **cạnh** repo này, rồi chạy `run.bat` trong kit một lần để cài thư viện:
   ```
   10-code\
     tiktok-live-kit\   (engine)
     tiktok-live-pgd\   (repo này)
   ```
   Kit để chỗ khác thì đặt biến `KIT_DIR` trỏ tới nó.
2. Chạy `run.bat` ở đây → bảng điều khiển http://localhost:3939, overlay cho OBS http://localhost:3939/overlay (1080 × 1920).

`run.bat` gọi server của kit với ba biến: `KIT_THEMES_DIR` (thư mục `themes/` ở đây), `KIT_DATA_DIR` (`data/`: luật đã chỉnh, phiên live, giọng đọc, không vào git) và `KIT_CONFIG` (`config.json`).

## Có gì

| Đường dẫn | Nội dung |
|---|---|
| `themes/chua/theme.json` | Hành động theo quà, danh hiệu, mục tiêu, giọng đọc, nội dung định kỳ, tiếng hiệu ứng |
| `themes/chua/scene.json` | Bố cục chánh điện đã đo trên ảnh nền: đường chân trời, phối cảnh, sàn, lối đi, 16 ghế, lư hương |
| `themes/chua/assets/` | Ảnh nền, nhân vật, nhạc nền (`music/`), tiếng hiệu ứng (`sfx/`) |
| `themes/chua/ASSETS.md` | Prompt tạo ảnh nền và các asset khác |
| `themes/chua/CREDITS.md` | Nguồn và giấy phép của từng asset |
| `themes/chua/tools/make-layout.py` | Vẽ bản phác bố cục để làm tham chiếu khi gen ảnh nền |

Sửa cảnh, luật, giọng đọc: xem `docs/THEME.md` trong kit.
