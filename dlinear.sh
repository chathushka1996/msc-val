# add --individual for DLinear-I
if [ ! -d "./drive/MyDrive/msc/logs" ]; then
    mkdir ./drive/MyDrive/msc/logs
fi

if [ ! -d "./drive/MyDrive/msc/logs/LongForecasting" ]; then
    mkdir ./drive/MyDrive/msc/logs/LongForecasting
fi
seq_len=336
model_name=DLinear

root_path_name=./data/us
data_path_name=solar.csv
model_id_name=solar_sl
data_name=custom
pred_len=96
random_seed=2021

for pred_len in 96 192 336 720
do
    python -u run_longExp.py \
    --is_training 1 \
    --root_path $root_path_name \
    --data_path $data_path_name \
    --model_id $model_name_$seq_len'_'96 \
    --model $model_name \
    --data custom \
    --features M \
    --seq_len $seq_len \
    --pred_len $pred_len \
    --enc_in 21 \
    --des 'Exp' \
    --itr 1 --batch_size 16  >drive/MyDrive/msc/logs/LongForecasting/$model_name'_'$seq_len'_'$pred_len.log
done