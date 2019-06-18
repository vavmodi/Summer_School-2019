#!/bin/bash
 
cutoffs="150 200 250 300 350 400 450 500 550 600 650 700 800 900"
#relcutoffs= "40 50 60 70 80 90 100"

inpfile=input.inp
 
relcutoff=60
#cutoff=400
 
for i in $cutoffs ; do
    work_dir=cutoff-${i}
    if [ ! -d $work_dir ] ; then
        mkdir $work_dir
    else
        rm -rf $work_dir/*
    fi
    sed -e "s/@relcutoff@/${relcutoff}/g" -e "s/@cutoff@/${i}/" $inpfile > $work_dir/$inpfile
    cp init_vacuum.xyz cp2k_taito.sh $work_dir/
    cd $work_dir
    sbatch cp2k_taito.sh
    cd ..
done
