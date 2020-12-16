#!/bin/bash

declare -a bench=("bzip" "hmmer" "libm" "jeng" "mcf")



for bench in "${bench[@]}"
do

	for num in {1..16}
	do
    		
      		echo $num
    		echo $bench
		./print_energy.py $bench/$num/results.txt $bench/$num/stats.txt >> $bench/energy.txt
		
    
	done
done








