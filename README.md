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
SOFTS_Hanoi_AirQuality.ipynb
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

## Chạy nhanh
```text
Các thực nghiệm chính được chạy trên Google Colab. Để chạy lại toàn bộ pipeline, mở notebook:
SOFTS_Hanoi_AirQuality.ipynb

Sau đó chạy lần lượt các cell từ đầu đến cuối.
Nếu chạy trên máy cá nhân, có thể cài đặt thư viện trước:

pip install -r requirements.txt

Sau đó chạy file chính:
python main.py

Lưu ý: main.py chủ yếu đóng vai trò entry point tham khảo. Pipeline đầy đủ nhất nằm trong notebook Colab.
```

## Script tham khảo

Thư mục script/ chứa các file .sh mô tả cấu hình thực nghiệm chính:
```text
script/run_softs_hanoi.sh
script/run_softs_ettm1.sh
script/run_baselines.sh
```
Các script này được dùng để ghi lại cấu hình chạy thí nghiệm, bao gồm độ dài đầu vào, độ dài dự báo, số biến, batch size, learning rate và số epoch. Tùy môi trường chạy, người dùng có thể cần điều chỉnh lại đường dẫn dữ liệu hoặc tham số trước khi chạy trực tiếp.

## Chạy một lệnh riêng lẻ

Ví dụ cấu hình tham khảo khi chạy SOFTS trên bộ dữ liệu Hà Nội:
```text
python main.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --model_id Hanoi_SOFTS_192_24 \
  --model SOFTS \
  --data custom \
  --root_path ./Data_train/ \
  --data_path Hanoi_AirQuality_Weather.csv \
  --features M \
  --seq_len 192 \
  --label_len 48 \
  --pred_len 24 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --d_model 128 \
  --d_core 64 \
  --e_layers 2 \
  --d_ff 256 \
  --dropout 0.1 \
  --batch_size 16 \
  --learning_rate 0.001 \
  --train_epochs 10 \
  --patience 3 \
  --itr 1
```
Ví dụ cấu hình tham khảo khi chạy SOFTS trên bộ dữ liệu ETTm1:
```text
python main.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --model_id ETTm1_SOFTS_96_96 \
  --model SOFTS \
  --data ETTm1 \
  --root_path ./Data_train/ \
  --data_path ETTm1.csv \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 96 \
  --enc_in 7 \
  --dec_in 7 \
  --c_out 7 \
  --d_model 128 \
  --d_core 64 \
  --e_layers 2 \
  --d_ff 256 \
  --dropout 0.1 \
  --batch_size 16 \
  --learning_rate 0.001 \
  --train_epochs 2 \
  --patience 3 \
  --itr 1
```
## Tham số quan trọng
```text
Tham số	Ý nghĩa
--root_path	Thư mục chứa file dữ liệu
--data_path	Tên file dữ liệu
--data	Kiểu dữ liệu sử dụng, ví dụ ETTm1 hoặc custom
--features	M cho dự báo đa biến
--seq_len	Độ dài chuỗi đầu vào
--label_len	Độ dài đoạn context dùng cho decoder nếu mô hình cần
--pred_len	Độ dài horizon cần dự báo
--enc_in	Số biến đầu vào
--dec_in	Số biến đưa vào decoder
--c_out	Số biến đầu ra
--model	Tên mô hình, ví dụ SOFTS, Transformer, DLinear, PatchTST
--d_model	Kích thước vector biểu diễn ẩn
--d_core	Kích thước biểu diễn lõi trong SOFTS
--e_layers	Số lớp encoder hoặc số lớp STAR
--batch_size	Kích thước batch
--learning_rate	Tốc độ học
--train_epochs	Số epoch huấn luyện
--patience	Số epoch chờ trước khi early stopping
--itr	Số lần lặp thực nghiệm
```
## Kết quả thực nghiệm

Các hình trực quan kết quả được lưu trong thư mục:
```text
results/figures/
```
## Các hình chính gồm:
```text
Hanoi_Prediction.png
ETT_Prediction_Fixed.png
Ablation_CO_Pro.png
Ablation_Time_Pro.png
```
## Ý nghĩa các hình:
```text
File	Nội dung
Hanoi_Prediction.png	Kết quả dự báo PM10, CO và NO2 trên dữ liệu Hà Nội
ETT_Prediction_Fixed.png	Kết quả dự báo trên bộ dữ liệu ETTm1
Ablation_CO_Pro.png	Ablation study về tác động của module MLP đối với dự báo CO
Ablation_Time_Pro.png	Ablation study về tác động của temporal embedding đối với dự báo CO
```
Bảng tổng hợp kết quả được lưu tại:
```text
results/metrics_summary.csv
```
## Một số kết quả chính:
```text
Dataset	Model	seq_len	pred_len	MAE	MSE
ETTm1	SOFTS	96	96	0.3674	0.3313
Hanoi Air Quality + Weather	SOFTS	192	24	0.8658	10.1278

Lưu ý: các kết quả so sánh trong từng thí nghiệm có thể khác nhau về cấu hình, biến mục tiêu hoặc thang đo đánh giá. Vì vậy, nên so sánh trực tiếp các mô hình trong cùng một bảng kết quả thay vì so sánh chéo giữa các mục khác nhau.
```
## Báo cáo

Báo cáo cuối cùng được lưu trong thư mục:
```text
report/
```
File báo cáo:
```text
TimeSeries_Final.pdf
Checkpoint và log
```
Các checkpoint, log huấn luyện và file tạm không được đưa lên GitHub để tránh làm repo quá nặng. Các loại file này đã được loại trừ trong .gitignore, ví dụ:

*.pth
*.pt
*.ckpt
checkpoints/
runs/
logs/
.ipynb_checkpoints/

## Trích dẫn

Phần triển khai mô hình SOFTS được tham khảo từ official implementation của tác giả. Nếu sử dụng lại code hoặc kết quả từ đề tài, vui lòng trích dẫn:

@inproceedings{han2024softs,
  title={SOFTS: Efficient Multivariate Time Series Forecasting with Series-Core Fusion},
  author={Han, Lu and Chen, Xu-Yao and Ye, Han-Jia and Zhan, De-Chuan},
  booktitle={Advances in Neural Information Processing Systems},
  year={2024}
}

Các tài liệu tham khảo chính:

Han et al. (2024). SOFTS: Efficient Multivariate Time Series Forecasting with Series-Core Fusion.
Vaswani et al. (2017). Attention Is All You Need.
Zeng et al. (2022). Are Transformers Effective for Time Series Forecasting?
Nie et al. (2023). A Time Series is Worth 64 Words: Long-term Forecasting with Transf
