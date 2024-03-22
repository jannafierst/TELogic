#!/bin/bash

#SBATCH --account iacc_jfierst
#SBATCH --qos highmem1
#SBATCH --partition highmem1
#SBATCH --output=out_%slim.log
#SBATCH --mail-user=jfierst@fiu.edu
#SBATCH --mail-type=ALL

#example
#export VARIABLE_PATH=/home/data/jfierst/FULL/PATH/HERE 

module load miniconda3-4.5.11-gcc-8.2.0-oqs2mbg

source activate /home/jfierst/.conda/envs/slim

bash nonWF_2Sexes_Arnaud.sh
#bash nonWF_Selfing_Arnaud.sh
#bash nonWF_Charlesworth.sh
#bash nonWF_Selfing_Charlesworth.sh
#bash nonWF_2Sexes_Parasites.sh
#bash nonWF_Selfing_Parasites.sh
