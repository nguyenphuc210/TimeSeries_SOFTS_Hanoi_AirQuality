# Scripts

Thư mục này chứa các script tham khảo cho quá trình thực nghiệm trong đề tài.

Các thực nghiệm chính của đề tài được thực hiện trên Google Colab thông qua notebook:

`SOFTS_Hanoi_AirQuality.ipynb`

Các file `.sh` trong thư mục này được dùng để mô tả lại cấu hình thực nghiệm chính, bao gồm:

- `run_softs_hanoi.sh`: cấu hình chạy SOFTS trên bộ dữ liệu Hà Nội Air Quality + Weather.
- `run_softs_ettm1.sh`: cấu hình chạy SOFTS trên bộ dữ liệu benchmark ETTm1.
- `run_baselines.sh`: mô tả các cấu hình baseline gồm Transformer, DLinear và PatchTST.

Lưu ý: tùy theo môi trường chạy, người dùng có thể cần điều chỉnh lại đường dẫn dữ liệu hoặc tham số trong script. Notebook Colab là nơi lưu đầy đủ pipeline huấn luyện, đánh giá và trực quan hóa kết quả.