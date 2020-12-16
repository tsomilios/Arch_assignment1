#!/bin/bash
declare -a bench=("bzip" "hmmer" "libm" "jeng" "mcf")



for bench in "${bench[@]}"
do

	for num in {1..16}
	do
    		
      		echo $num
    		echo $bench
		./GEM5ToMcPAT.py $bench/$num/stats.txt $bench/$num/config.json inorder_arm.xml -o $bench/out/$bench$num-out.xml
		
    
	done
done

