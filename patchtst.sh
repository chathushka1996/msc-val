if [ ! -d "./drive/MyDrive/msc/logs" ]; then
    mkdir ./drive/MyDrive/msc/logs
fi

if [ ! -d "./drive/MyDrive/msc/logs/LongForecasting" ]; then
    mkdir ./drive/MyDrive/msc/logs/LongForecasting
fi
seq_len=336
model_name=PatchTST

root_path_name=./data/us
data_path_name=solar.csv
model_id_name=solar_sl
data_name=custom
pred_len=96
random_seed=2021

for pred_len in 96 192 336 720
do
    python -u run_longExp.py \
      --random_seed $random_seed \
      --is_training 1 \
      --root_path $root_path_name \
      --data_path $data_path_name \
      --model_id $model_id_name$seq_len'_'$pred_len \
      --model $model_name \
      --data $data_name \
      --features M \
      --seq_len $seq_len \
      --pred_len $pred_len \
      --enc_in 21 \
      --e_layers 3 \
      --n_heads 16 \
      --d_model 128 \
      --d_ff 256 \
      --dropout 0.2\
      --fc_dropout 0.2\
      --head_dropout 0\
      --patch_len 16\
      --stride 8\
      --des 'Exp' \
      --train_epochs 20\
      --patience 20\
      --itr 1 --batch_size 128 --learning_rate 0.0001 >drive/MyDrive/msc/logs/LongForecasting/$model_name'_'$model_id_name'_'$seq_len'_'$pred_len.log
done