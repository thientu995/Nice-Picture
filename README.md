# Chọn ảnh đẹp — Hướng dẫn sử dụng

Ứng dụng giúp bạn tự động chọn ra những bức ảnh đẹp nhất từ một buổi chụp
(ví dụ: chụp sinh nhật cho bé), sau đó duyệt qua và giữ lại những tấm ưng
ý nhất chỉ bằng vài cú nhấp chuột.

## Bắt đầu

1. Giải nén file zip (nếu tải về dạng zip) vào một thư mục bất kỳ.
2. Mở file **Chon-Anh-Dep.exe**.
   - Nếu Windows hiện cảnh báo xanh, bấm **More info → Run anyway**.
   - Lần mở đầu sẽ chậm hơn một chút (khoảng 1 phút), các lần sau nhanh.
3. Trong chương trình: bấm **📁 Chọn thư mục ảnh…** → chọn thư mục chứa ảnh
   → bấm **▶ Phân tích**.

⚠️ Giữ nguyên cấu trúc thư mục sau khi giải nén (file exe nằm cùng các file
liên quan và thư mục `models`).

## Chọn ảnh

- Sau khi phân tích, ảnh hiện ra dạng lưới kèm điểm chất lượng
  (`s` = điểm tổng, càng cao càng tốt; `a` = điểm thẩm mỹ tham khảo).
- **Viền xanh** là những ảnh ứng dụng đề xuất. Bạn có thể:
  - **Nhấp chuột** vào ảnh để chọn hoặc bỏ chọn
  - Bấm **Áp dụng đề xuất / Chọn hết / Bỏ hết** để chọn nhanh
  - Đánh dấu **Chỉ hiện ảnh được đề xuất** để lọc bớt
  - **Sắp xếp** theo thứ tự chụp hoặc theo điểm cao
- **Nhấp phải chuột** (hoặc double-click) vào ảnh để **xem ảnh lớn**;
  phím ←/→ chuyển ảnh, **Esc** đóng.
- Bộ đếm **"Đã chọn"** ở góc phải cho biết bạn đã giữ bao nhiêu ảnh.

## Phân tích theo ngữ cảnh (tùy chọn)

Trên thanh công cụ có hàng **"Phân tích theo:"** cho phép bật/tắt từng
tiêu chí (luôn cần chọn ít nhất một):

| Tiêu chí | Ý nghĩa |
|---|---|
| **Nét & sáng** | Độ nét, ảnh quá tối/quá cháy sáng |
| **Mặt & mắt mở** | Ưu tiên ảnh thấy rõ mặt, mắt không nhắm |
| **Biểu cảm (AI)** | Ưu tiên ảnh bé đang cười, ngạc nhiên sinh động |
| **Thẩm mỹ (AI)** | Chấm điểm thẩm mỹ tham khảo (hiển thị ở `a`) |

Bấm **▶ Phân tích** lại sau khi đổi lựa chọn để áp dụng.

## Lưu kết quả

Bấm **💾 Lưu lựa chọn…**, chọn nơi lưu — ứng dụng sẽ:

- Copy **ảnh gốc chất lượng đầy đủ** của những ảnh bạn chọn sang thư mục mới
- Tạo file `danh-sach.txt` (danh sách nhóm theo cảnh) và `scores.csv`
  (bảng điểm chi tiết của toàn bộ ảnh, mở bằng Excel)

## Cập nhật

Bấm **🔄 Kiểm tra cập nhật** trên thanh công cụ — ứng dụng sẽ thông báo
nếu có phiên bản mới và mở trang tải về cho bạn.

## Câu hỏi thường gặp

**Lần mở đầu chậm?** Lần đầu tiên sau khi giải nén, Windows cần quét các
file của ứng dụng (khoảng 1 phút). Các lần mở sau sẽ nhanh.

**Windows hiện cảnh báo khi mở?** Đây là cảnh báo chung cho ứng dụng chưa
mua chữ ký số. Bấm **More info → Run anyway** để tiếp tục.

**Phân tích chậm?** Nếu ảnh nằm trên OneDrive/Google Drive ở chế độ
"chỉ trực tuyến", hãy mở thư mục trong File Explorer để máy tải ảnh về
đầy đủ trước khi phân tích. Với AI bật, khoảng 700 ảnh mất 5–10 phút.

**Muốn đổi ảnh đã chọn?** Nhấp bỏ chọn ảnh này, nhấp chọn ảnh khác rồi
bấm **Lưu lựa chọn…** lại.

**Máy Mac / Linux?** Bản cài đặt cho hệ điều hành này được cung cấp riêng —
liên hệ nơi bạn nhận ứng dụng.

## Yêu cầu máy tính

- Windows 10/11 (64-bit)
- Không cần cài đặt thêm bất kỳ chương trình nào
- Bộ nhớ trống khoảng 1GB cho lần chạy đầu
