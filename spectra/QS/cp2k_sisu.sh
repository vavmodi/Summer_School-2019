#!/bin/bash -l
#SBATCH -t 00:30:00
#SBATCH -J spectra-qs 
#SBATCH -p test
#SBATCH -o ocp2k.%j
#SBATCH -e ecp2k.%j
#SBATCH -N 8

(( ncores = SLURM_NNODES * 24 ))
# this calculates the number of cores based on reserved nodes above (-N flag for Slurm)
export CP2K_DATA_DIR=/appl/chem/cp2k/data

module load cp2k/6.1-gnu-elpa
#module unload craype-hugepages
#module load cp2k

aprun -n 192 cp2k.popt input.inp > input.out 
