#!/bin/bash

# Reference script for SOFTS on ETTm1 benchmark dataset
# Main experiments were conducted in Google Colab:
# SOFTS_Hanoi_AirQuality.ipynb

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