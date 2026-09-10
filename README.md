# Chọn ảnh đẹp — tool tự động chọn ảnh đẹp nhất từ một thư mục (có GUI)

Tool tự động hóa quy trình lọc ảnh sau một buổi chụp (đặc biệt hợp với ảnh
chụp trẻ em sinh nhật, có nhiều chuỗi ảnh chụp liên tục gần giống nhau).
Chạy trên **Windows, macOS và Linux**, có **giao diện đồ hoạ** để bạn xem
ảnh và chọn bằng chuột.

## Bản .exe đóng gói sẵn (Windows)

`Chon-Anh-Dep.exe` (trong thư mục này) là bản đã biên dịch bằng Nuitka:
người dùng **không cần cài Python hay bất cứ thứ gì** — chỉ cần 1 file exe,
nhấp đôi là chạy. Lưu ý:

- Lần chạy đầu chậm hơn (tự giải nén ~200MB vào cache, antivirus quét);
các lần sau nhanh hơn vì đã có cache.
- File chưa ký số (code signing) nên Windows SmartScreen có thể hiện cảnh
báo — bấm "More info" → "Run anyway".
- File exe này chỉ chạy trên Windows; bản macOS/Linux phải build riêng trên
từng hệ điều hành (Nuitka không cross-compile), quy trình giống hệt.

## Cài đặt cho bản chạy từ mã nguồn (một lần)

Cần Python 3.9+ rồi cài 3 thư viện:

```
pip install opencv-python pillow numpy
```

- Ảnh iPhone .HEIC: cài thêm `pip install pillow-heif`
- Ubuntu/Debian nếu báo lỗi tkinter: `sudo apt install python3-tk`

## Cách dùng — giao diện đồ hoạ (khuyên dùng)

**Windows:** double-click `Chon-Anh.bat` (có thể kéo-thả thư mục ảnh vào
file này). **macOS/Linux:** chạy `./chon-anh.sh`. Hoặc:

```
python chon_anh_gui.py
```

Các bước trong cửa sổ:

1. **📁 Chọn thư mục ảnh…** → bấm **▶ Phân tích**. Ảnh hiện dần ra dạng
   lưới kèm điểm chất lượng (`s` càng cao càng nét/đẹp kỹ thuật).
2. Tool **tự đánh dấu viền xanh** N ảnh đề xuất. Bạn **nhấp vào ảnh** để
   chọn/bỏ chọn tuỳ ý — bộ đếm "Đã chọn" cập nhật liên tục.
3. Công cụ hỗ trợ: sắp xếp theo thứ tự chụp hoặc điểm cao trước; lọc
   "chỉ hiện ảnh được đề xuất"; nút Áp dụng đề xuất / Chọn hết / Bỏ hết.
4. **Nhấp phải (hoặc double-click)** để xem ảnh lớn (phím ← → chuyển ảnh,
   Esc đóng).
5. **💾 Lưu lựa chọn…** → tool copy ảnh gốc nguyên bản sang thư mục mới
   kèm `danh-sach.txt` và `scores.csv`, rồi hỏi mở thư mục luôn.

## Cách dùng — dòng lệnh (không cần cửa sổ)

```
python chon_anh.py "D:\Photos\buoi chup" --count 80 --sheets
```

| Tham số | Ý nghĩa |
|---|---|
| `--count N` | số hình cần chọn (mặc định 60) |
| `--out "ĐƯỜNG DẪN"` | thư mục kết quả (mặc định: `<thư mục ảnh>_chon_N`) |
| `--sheets` | tạo contact sheets xem nhanh toàn bộ ảnh |
| `--workers 8` | số luồng song song (ảnh ở ổ chậm/OneDrive nên để 8–16) |

## Tool chấm điểm thế nào?

1. **Chấm kỹ thuật từng ảnh**: độ nét toàn ảnh, độ nét riêng vùng mặt,
   mắt có mở không, mặt chiếm bao nhiêu khung, ảnh cháy sáng/tối không.
2. **Loại ảnh "sinh đôi"**: các khung chụp bùng (burst) gần trùng nhau
   được gộp lại (so số thứ tự file + độ giống khung hình — ngưỡng hiệu
   chuẩn trên ảnh thật), tránh chọn 2-3 ảnh y hệt cùng một tư thế.
3. **Chọn đều các cảnh**: trước tiên lấy ảnh đẹp nhất của *mỗi nhóm*,
   sau đó lấp đủ số lượng; hai ảnh được chọn phải cách nhau quá 2 khung
   để không dồn vào một tư thế.
4. **Xuất kết quả**: ảnh gốc nguyên bản + `danh-sach.txt` (nhóm theo cảnh)
   + `scores.csv` (điểm toàn bộ ảnh — dùng để đối chiếu khi hoán đổi).

## Mẹo dùng tốt

- Muốn **đổi ảnh thủ công**: mở `scores.csv`, xem các ảnh lân cận có điểm
  gần bằng nhau, copy tay ảnh thích hợp hơn vào thư mục kết quả. Trong
  GUI thì đơn giản hơn: nhấp chọn/bỏ chọn rồi Lưu lại.
- Ảnh **phong cảnh/không có người**: vẫn chọn được (điểm mặt bị trừ nhẹ).
- **Gu thẩm mỹ máy không thay được hoàn toàn**: biểu cảm đáng yêu, khoảnh
  khắc "đúng chất" vẫn nên lướt qua lưới ảnh trong GUI rồi quyết định —
  đó là lý do tool có giao diện chọn tay.
- Ảnh nằm trên **OneDrive/Google Drive** đang "online-only" sẽ đọc chậm —
  mở thư mục trong Explorer/Finder cho tải hết về trước khi chạy.

## Giới hạn

- Nhận diện mắt mở bằng Haar cascade khá thô — ảnh nghiêng nhiều có thể
  bị chấm mắt nhắm/mở không chính xác.
- Không phân biệt "biểu cảm đẹp/xấu" — chỉ đo được nét, sáng, mắt, độ
  giống nhau giữa các ảnh.
