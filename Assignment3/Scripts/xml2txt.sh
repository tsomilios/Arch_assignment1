#!/bin/bash
declare -a bench=("bzip" "hmmer" "libm" "jeng" "mcf")



for bench in "${bench[@]}"
do

	for num in {1..16}
	do
    		
      		echo $num
    		echo $bench
		./mcpat -infile Scripts/$bench/out/$bench$num-out.xml -print_level 5 > Scripts/$bench/txt/$num-results.txt
		
    
	done
done

