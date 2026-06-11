#!/bin/bash

# Reference script for baseline experiments
# Baseline models: Transformer, DLinear, PatchTST
# Main experiments were conducted in Google Colab:
# SOFTS_Hanoi_AirQuality.ipynb

echo "Baseline experiments are implemented in SOFTS_Hanoi_AirQuality.ipynb"
echo "Models: Transformer, DLinear, PatchTST"
echo "Dataset: Hanoi Air Quality + Weather"
echo "Input length: seq_len = 192"
echo "Prediction length: pred_len = 24"
echo "Metrics: MSE, MAE"

# Example reference commands if main.py supports these arguments:

# Transformer
# python main.py \
#   --model Transformer \
#   --data custom \
#   --root_path ./Data_train/ \
#   --data_path Hanoi_AirQuality_Weather.csv \
#   --features M \
#   --seq_len 192 \
#   --pred_len 24 \
#   --enc_in 7 \
#   --dec_in 7 \
#   --c_out 7 \
#   --batch_size 16 \
#   --learning_rate 0.001 \
#   --train_epochs 10

# DLinear
# python main.py \
#   --model DLinear \
#   --data custom \
#   --root_path ./Data_train/ \
#   --data_path Hanoi_AirQuality_Weather.csv \
#   --features M \
#   --seq_len 192 \
#   --pred_len 24 \
#   --enc_in 7 \
#   --dec_in 7 \
#   --c_out 7 \
#   --batch_size 16 \
#   --learning_rate 0.001 \
#   --train_epochs 10

# PatchTST
# python main.py \
#   --model PatchTST \
#   --data custom \
#   --root_path ./Data_train/ \
#   --data_path Hanoi_AirQuality_Weather.csv \
#   --features M \
#   --seq_len 192 \
#   --pred_len 24 \
#   --enc_in 7 \
#   --dec_in 7 \
#   --c_out 7 \
#   --batch_size 16 \
#   --learning_rate 0.001 \
#   --train_epochs 10