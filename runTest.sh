#!/bin/bash

fullDir="./contracts/full"

for folder in "$fullDir"/*; do
	if [ -d "$folder" ]; then
		foldername=$(basename "$folder")
		echo "$foldername"

		for file in "$folder"/*.sol; do
			if [ -f "$file" ]; then
				filename=$(basename -- "$file")
				echo "Compiling $filename in $foldername..."
				truffle compile "$file"
			fi
		done
	fi
done

