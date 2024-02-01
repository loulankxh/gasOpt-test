#!/bin/bash

# fullDir="./contracts/full"

# for folder in "$fullDir"/*; do
# 	if [ -d "$folder" ]; then
# 		foldername=$(basename "$folder")
# 		echo "$foldername"

# 		for file in "$folder"/*.sol; do
# 			if [ -f "$file" ]; then
# 				filename=$(basename -- "$file")
# 				echo "Compiling $filename in $foldername..."
# 				truffle compile "$file"
# 			fi
# 		done
# 	fi
# done

minDir="./contracts/min"

for folder in "$minDir"/*; do
	if [ -d "$folder" ]; then
		foldername=$(basename "$folder")
		echo "$foldername"

		for file in "$folder"/*.sol; do
			if [ -f "$file" ]; then
				filename=$(basename -- "$file")
				echo "Compiling $filename in $foldername..."
				truffle compile "$file"
				truffle test ./test_longTrace/${foldername}_test_gas.js --compile-none
			fi
		done
	fi
done

# minNoArithmeticDir="./contracts/min-noArithmetic"

# for folder in "$minNoArithmeticDir"/*; do
# 	if [ -d "$folder" ]; then
# 		foldername=$(basename "$folder")
# 		echo "$foldername"

# 		for file in "$folder"/*.sol; do
# 			if [ -f "$file" ]; then
# 				filename=$(basename -- "$file")
# 				echo "Compiling $filename in $foldername..."
# 				truffle compile "$file"
# 			fi
# 		done
# 	fi
# done

# noMinArithmeticDir="./contracts/fullArithmetic"

# for folder in "$noMinArithmeticDir"/*; do
# 	if [ -d "$folder" ]; then
# 		foldername=$(basename "$folder")
# 		echo "$foldername"

# 		for file in "$folder"/*.sol; do
# 			if [ -f "$file" ]; then
# 				filename=$(basename -- "$file")
# 				echo "Compiling $filename in $foldername..."
# 				truffle compile "$file"
# 			fi
# 		done
# 	fi
# done

noOptimization="./contracts/noOptimization"

for folder in "$noOptimization"/*; do
	if [ -d "$folder" ]; then
		foldername=$(basename "$folder")
		echo "$foldername"

		for file in "$folder"/*.sol; do
			if [ -f "$file" ]; then
				filename=$(basename -- "$file")
				echo "Compiling $filename in $foldername..."
				truffle compile "$file"
				truffle test ./test_longTrace/${foldername}_test_gas.js --compile-none
			fi
		done
	fi
done

# reference="./contracts/reference"

# for folder in "$reference"/*; do
# 	if [ -d "$folder" ]; then
# 		foldername=$(basename "$folder")
# 		echo "$foldername"

# 		for file in "$folder"/*.sol; do
# 			if [ -f "$file" ]; then
# 				filename=$(basename -- "$file")
# 				echo "Compiling $filename in $foldername..."
# 				truffle compile "$file"
# 				truffle test ./test_longTrace/${foldername}_test_gas.js --compile-none
# 			fi
# 		done
# 	fi
# done