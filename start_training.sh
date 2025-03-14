#!/bin/bash
#SBATCH --job-name=start_llm_training_job   # Job name
#SBATCH --output=logs/output.log            # Standard output log
#SBATCH --error=logs/error.log              # Standard error log
#SBATCH --time=02:00:00                     # Time limit hh:mm:ss
#SBATCH --partition=compute                 # Partition name

# Load necessary modules (if needed)
module load miniconda
eval "$(conda shell.bash hook)"
conda activate env1
module load cuda/12.4

cd /home/kernelpanic/bitirme/LLMTraining/

# Create logs directory if it doesn't exist
mkdir -p logs

# pip3.11 install -r requirements.txt

# Run the training script
echo "Training started at $(date)"
jupyter nbconvert --to script unsloth-training.ipynb
python unsloth-training.py
echo "Training finished at $(date)"
