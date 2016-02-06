#!/bin/bash

# Safer shell scripting
set -euf -o pipefail

make all

for dim in 10 100 1000; do
	for run in {1..10}; do
		printf "\nDim %4d, Run %2d:\n" "$dim" "$run"
		name=$(printf "dim%d_run%d.txt" "$dim" "$run")
		# perf stat --output "java_$name" java Javamatrix "$dim"
		perf stat --output "clang_$name" ./cmatrix-clang "$dim"
		perf stat --output "gcc_$name" ./cmatrix-gcc "$dim"
	done
done
