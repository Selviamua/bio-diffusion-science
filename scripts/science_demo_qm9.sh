#!/usr/bin/env bash
# 简化版 Demo：使用 GCDM 生成一批 QM9 小分子样本
# 依赖：按 README 创建好 bio-diffusion 环境并在项目根目录下执行

set -e

echo "[Demo] 激活 conda 环境（如失败请手动激活）"
# 如本机不支持，可注释掉下一行，手动 `conda activate bio-diffusion`
conda activate bio-diffusion || echo "请确保已手动激活环境：conda activate bio-diffusion"

echo "[Demo] 使用预训练模型生成 3D 分子（QM9，无条件生成）"
python3 src/mol_gen_sample.py \
  datamodule=edm_qm9 \
  model=qm9_mol_gen_ddpm \
  logger=csv \
  trainer.accelerator=gpu \
  trainer.devices=[0] \
  ckpt_path="checkpoints/QM9/Unconditional/model_1_epoch_979-EMA.ckpt" \
  num_samples=250 \
  num_nodes=19 \
  all_frags=true \
  sanitize=false \
  relax=false \
  num_resamplings=1 \
  jump_length=1 \
  num_timesteps=1000 \
  output_dir="./science_demo_outputs" \
  seed=123

echo "[Demo] 生成完成，结果已保存在 ./science_demo_outputs 目录下的 .sdf 文件中。"
