EXP_DIR=output/r50_ms_smca_e12

if [ ! -d "output" ]; then
    mkdir output
fi

if [ ! -d "${EXP_DIR}" ]; then
    mkdir ${EXP_DIR}
fi

srun -p dsta \
    --job-name=t8 \
    --gres=gpu:8 \
    --ntasks=8 \
    --ntasks-per-node=8 \
    --cpus-per-task=4 \
    --kill-on-bad-exit=1 \
    -w SG-IDC1-10-51-2-34 \
    python main.py \
    --batch_size 2 \
    --smca \
    --multiscale \
    --epochs 12 \
    --lr_drop 10 \
    --output_dir ${EXP_DIR} \
     2>&1 | tee ${EXP_DIR}/detailed_log.txt
