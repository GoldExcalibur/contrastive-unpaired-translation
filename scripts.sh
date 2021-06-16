##### train cut model ###############
# python train.py \
# --save_epoch_freq 20 \
# --display_id 0 --no_html \
# --dataroot ./datasets/grumpifycat \
# --gpu_ids 1 --name grumpifycat_CUT --CUT_mode CUT

# --gpu_ids 1 --name grumpifycat_FastCUT --CUT_mode FastCUT

# python train.py \
# --save_epoch_freq 20 \
# --display_id 0 --no_html \
# --dataroot ./datasets/horse2zebra \
# --gpu_ids 1 --name horse2zebra_FastCUT --CUT_mode FastCUT

# --gpu_ids 1 --name horse2zebra_CUT --CUT_mode CUT 

# python train.py  --display_id 0 --no_html \
# --save_epoch_freq 50 \
# --dataroot ./datasets/cat2dog \
# --name cat2dog_CUT --model cut --CUT_mode CUT \
# --batch_size 4 --gpu_ids 0


##### test cut model ################
# python test.py --dataroot ./datasets/grumpifycat \
# --name grumpifycat_FastCUT --CUT_mode FastCUT --phase train
# --name grumpifycat_CUT --CUT_mode CUT --phase train

# python test.py --dataroot ./datasets/horse2zebra \
# --name horse2zebra_CUT --CUT_mode CUT --phase train

# --name horse2zebra_FastCUT --CUT_mode FastCUT --phase train

##### improvement: cut_v2 ##########
# python train.py \
# --save_epoch_freq 20 \
# --display_id 0 --no_html \
# --dataroot ./datasets/grumpifycat \
# --name grumpifycat_CUT_v2 --model cutv2 --CUT_mode CUT \
# --gpu_ids 1 --batch_size 2

# python test.py --dataroot ./datasets/grumpifycat \
# --name grumpifycat_CUT_v2 --CUT_mode CUT --phase train --model cutv2 \
# --gpu_ids 2 

cut_cat='./results/grumpifycat_CUT/train_latest/images'
fast_cat='./results/grumpifycat_FastCUT/train_latest/images'
cutv2_cat='./results/grumpifycat_CUT_v2/train_latest/images'
# python -m pytorch_fid $cut_cat/real_B $cut_cat/fake_B
# python -m pytorch_fid $fast_cat/real_B $fast_cat/fake_B
python -m pytorch_fid $cutv2_cat/real_B $cutv2_cat/fake_B

cut_horse='./results/horse2zebra_CUT/train_latest/images'
fast_horse='./results/horse2zebra_FastCUT/train_latest/images'
# python -m pytorch_fid $cut_horse/real_B $cut_horse/fake_B
# python -m pytorch_fid $fast_horse/real_B $fast_horse/fake_B