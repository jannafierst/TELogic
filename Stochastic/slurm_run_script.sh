#!/bin/bash

#SBATCH --account user_account
#SBATCH --qos quality_of_service
#SBATCH --partition node_to_run_on
#SBATCH --output=out_%slim.log
#SBATCH --mail-user=user@uni.edu
#SBATCH --mail-type=ALL

# example script for simulating populations on a SLURM system

module load miniconda3-4.5.11-gcc-8.2.0-oqs2mbg # miniconda module

source activate slim # slim module

bash run_slim.sh # compute
