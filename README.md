# TimeSeries_SOFTS_Hanoi_AirQuality
SOFTS-based multivariate time series forecasting for Hanoi air quality and weather data.
Thư mục này chứa phần thực nghiệm mô hình SOFTS cho bài toán dự báo chuỗi thời gian đa biến. Code được sử dụng để huấn luyện và đánh giá mô hình dự báo chất lượng không khí Hà Nội, gồm:

- SOFTS: mô hình chính dựa trên cơ chế Series-Core Fusion.
- Transformer: baseline sử dụng self-attention.
- DLinear: baseline tuyến tính dựa trên phân rã chuỗi thời gian.
- PatchTST: baseline dựa trên patching cho time series.

README này tập trung vào cách tổ chức repo, dữ liệu, notebook và kết quả thực nghiệm.

## Cấu trúc thư mục
```text
TimeSeries_SOFTS_Hanoi_AirQuality/
+-- Data_train/          # Dữ liệu ETTm1 và Hanoi Air Quality + Weather
+-- data_provider/       # Hàm đọc dữ liệu, chia train/val/test
+-- models/              # Mã nguồn các mô hình SOFTS, Transformer, DLinear, PatchTST
+-- script/              # Script hoặc lệnh chạy thí nghiệm
+-- utils/               # Metric, visualization, tools
+-- results/             # Hình ảnh và bảng kết quả
+-- report/              # Báo cáo cuối cùng
+-- SOFTS_Hanoi.ipynb    # Notebook thực nghiệm chính trên Google Colab
+-- SOFTS_Model.ipynb    # Notebook minh họa mô hình nếu có
+-- main.py
+-- requirements.txt
+-- README.md
```
## Môi trường

```text
Khuyến nghị sử dụng Python 3.8+ và PyTorch. Các thí nghiệm chính được thực hiện trên Google Colab.
```
## Cài đặt các thư viện cần thiết:

```text
pip install -r requirements.txt
```
## Các thư viện chính:
```text
pip install numpy pandas matplotlib scikit-learn torch tqdm einops openpyxl
```
## Chuẩn bị dữ liệu

Đặt dữ liệu trong thư mục:
```text
Data_train/
```
Ví dụ:
```text
Data_train/Hanoi_AirQuality_Weather.csv
Data_train/ETTm1.csv
```
Bộ dữ liệu Hà Nội gồm 7 biến:
```text
PM10, CO, NO2, temperature, humidity, precipitation, wind_speed
```
Bộ dữ liệu ETTm1 gồm 7 biến:
```text
HUFL, HULL, MUFL, MULL, LUFL, LULL, OT
```
## Notebook thực nghiệm

Notebook chính:
```text
SOFTS_Hanoi.ipynb
```
Các bước chính trong notebook:
```text
Import thư viện.
Đọc dữ liệu.
Tiền xử lý và chuẩn hóa dữ liệu.
Chia dữ liệu theo thứ tự thời gian thành train/validation/test.
Tạo sliding window.
Huấn luyện mô hình SOFTS.
Đánh giá bằng MSE và MAE.
Trực quan hóa kết quả dự báo.
```
## Cấu hình thực nghiệm

Với bộ dữ liệu Hà Nội:
```text
seq_len = 192
pred_len = 24
features = M
số biến = 7
metrics = MSE, MAE
```
Với bộ dữ liệu ETTm1:
```text
seq_len = 96
pred_len = 96
features = M
số biến = 7
metrics = MSE, MAE
```