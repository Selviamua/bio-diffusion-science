# Bio-Diffusion-Science：面向分子生成与优化的开源科研模型

> 基于几何完备扩散模型（Geometry-Complete Diffusion Model, GCDM）的 3D 分子生成与性质优化开源项目  
> 原始代码来源：[BioinfoMachineLearning/bio-diffusion](https://github.com/BioinfoMachineLearning/bio-diffusion)（MIT License）

---

## 1. 项目定位与参赛说明

本项目以 Bio-Diffusion 为基础，对其进行整理与二次封装，目标是：

- **科研模型（AI 模型）**：  
  - 几何完备扩散模型，用于 3D 分子结构的生成与性质优化。
- **科研工具**：  
  - 提供命令行脚本与 Notebook，支持研究者快速生成候选分子并进行性质评估。
- **科研工作流雾形**：  
  - 结合数据下载、模型调用与结果分析，构建“分子生成 → 性质筛选 → 结果可视化”的基础流程。

本仓库由个人在原始开源代码基础上进行轻量改造与中文文档补充，用于 “AI+科研创新赛道：构建开源科研生态，加速科学发现” 相关评定与后续科研实践。

---

## 2. 核心功能概览

1. **3D 分子生成（小分子 / 药物分子）**
   - 无条件生成 QM9 小分子
   - 无条件生成 GEOM-Drugs 药物级分子

2. **性质条件分子生成**
   - 以 QM9 数据集为例，可按极化率、能隔等物理化学性质设定条件生成新分子。

3. **分子性质优化**
   - 支持以已有分子为起点，对目标性质进行迭代优化（如能隔、稳定性等）。

4. **科研复现实验说明**
   - README 中给出了模型训练与论文结果复现的完整命令；本仓库保持一致。

---

## 3. 环境与依赖

> 如资源有限，仅使用“生成 Demo”功能即可，无需完整复现论文全部实验。

1. 安装 Mambaforge（详见原仓库 README）：
   ```bash
   wget "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
   bash Mambaforge-$(uname)-$(uname - m).sh
   source ~/.bashrc
   ```

2. 克隆本仓库并创建环境：
   ```bash
   git clone https://github.com/<你的用户名>/bio-diffusion-science.git
   cd bio-diffusion-science
   mamba env create -f environment.yaml
   conda activate bio-diffusion
   pip3 install -e .
   ```

3. 下载数据与模型（如只做 Demo，可仅下载模型）：
   - 数据（EDM 预备数据，~100 GB）  
   - 模型检查点（GCDM_Checkpoints，~5 GB）  

   命令参考 `README.md` 中的原始说明。

---

## 4. 快速 Demo：生成 QM9 小分子（已封装脚本）

在 `scripts/` 目录下提供了一个简化 Demo 脚本（`science_demo_qm9.sh`），示例用法：

```bash
bash scripts/science_demo_qm9.sh
```

该脚本将调用 GCDM 的预训练模型，在 QM9 上无条件生成一批 3D 分子结构，并在当前目录下输出 `.sdf` 文件，可用于后续可视化与分析。

---

## 5. 科研应用场景事例

本项目的潜在科研应用包括（但不限于）：

1. **新材料 / 新分子设计**  
   研究者可设定目标物性范围（例如带隔、极化率等），使用条件生成或优化功能产生候选分子，后续再结合 DFT 计算或实验验证筛选潜在材料。

2. **药物发现早期筛选**  
   利用 GEOM-Drugs 相关配置，在药物级分子空间中快速生成结构合理的候选分子，再对接虚拟筛选、对接打分等下流工具。

3. **教学与方法学研究**  
   作为扩散模型与几何深度学习结合的典型案例，用于课程教学、方法对比实验、以及与其他生成模型（如 VAE、GAN）的比较研究。

在上述场景中，本项目提供了统一的代码与配置入口，可较为方便地与下流分析方法连接，实现 **“生成 → 分析 → 筛选”** 的基础科研工作流。

---

## 6. 与“构建开源科研生态、加速科学发现”的关系

- **开放性**：采用 MIT License，保留原作者罗名的前提下可自由修改与再分变。
- **可复现性**：提供完整的环境配置文件、数据与模型下载链接及复现实验命令。
- **可扩展性**：研究者可在本项目基础上：
  - 替换/扩展数据集
  - 设计新的分子性质或评价指标
  - 与自有的分析/可视化工具整合
- **社区协作**：欢迎通过 Issue / Pull Request 的方式提交改善建议与新任务配置。

---

## 7. 引用与致谢

如在科研工作中使用本项目，请引用原始论文：

> Morehead, A. & Cheng, J. (2024). Geometry-complete diffusion for 3D molecule generation and optimization. *Communications Chemistry*, 7, 150.

原始代码仓库：  
- https://github.com/BioinfoMachineLearning/bio-diffusion


## 8. 模型与数据下载

如仅运行示例，可只下载 QM9 预训练模型检查点：
链接（需手动复制到浏览器打开）：
https://zenodo.org/record/13375913/files/model_1_epoch_979-EMA.ckpt?download=1

下载后，将文件放入：
checkpoints/QM9/Unconditional/
并命名为：
model_1_epoch_979-EMA.ckpt

若需完整复现实验，可按原仓库 README 的说明下载 QM9（约100 GB）和 GEOM-Drugs（约500 GB）数据集以及对应模型检查点。

## 9. 科研生态贡献与工作流图示

以下 Mermaid 图示意了本项目在科研流程中的应用：

```mermaid
graph LR
A[分子生成模型] --> B[性质优化]
B --> C[分子筛选]
C --> D[材料/药物研发]
```

## 10. 模型生成示例

使用脚本 `scripts/science_demo_qm9.sh` 可快速运行 QM9 无条件分子生成示例：

```bash
bash scripts/science_demo_qm9.sh
```

该脚本将调用预训练模型生成一批 3D 分子，并将结果保存至 `./science_demo_outputs` 目录。

## 11. 模型生成示例图片

下图为使用 GCDM 模型生成并可视化的 QM9 分子示例（在本地运行 science_demo_qm9.sh 得到）：

![demo1](img/demo_results/mol1.png)
![demo2](img/demo_results/mol2.png)
![demo3](img/demo_results/mol3.png)

在此基础上的中文文档与轻量封装由个人维护，仅用于学习与科研目的。
