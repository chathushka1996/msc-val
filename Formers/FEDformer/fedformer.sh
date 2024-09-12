# cd FEDformer
# add --individual for DLinear-I
if [ ! -d "./drive/MyDrive/msc/logs" ]; then
    mkdir ./drive/MyDrive/msc/logs
fi

if [ ! -d "./drive/MyDrive/msc/logs/LongForecasting" ]; then
    mkdir ./drive/MyDrive/msc/logs/LongForecasting
fi

seq_len=96
dataset=sl
root_path_name=./data/$dataset
data_path_name=solar.csv
model_id_name=solar_$dataset
data_name=custom
random_seed=2021
model_name=FEDformer

for preLen in 96 192 336 720
do
python -u run.py \
  --is_training 1 \
  --root_path $root_path_name \
  --data_path $data_path_name \
  --task_id $model_id_name \
  --model $model_name \
  --data $data_name \
  --features M \
  --seq_len $seq_len \
  --label_len 48 \
  --pred_len $preLen \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 8 \
  --dec_in 8 \
  --c_out 8 \
  --des 'Exp' \
  --d_model 512 \
  --itr 1  >drive/MyDrive/msc/logs/LongForecasting/$model_name'_'$model_id_name'_'$preLen.log
done