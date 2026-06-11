#!/bin/bash

# Reference script for SOFTS on Hanoi Air Quality + Weather dataset
# Main experiments were conducted in Google Colab:
# SOFTS_Hanoi_AirQuality.ipynb

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