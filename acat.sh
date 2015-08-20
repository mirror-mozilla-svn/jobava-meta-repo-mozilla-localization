#!/bin/bash

# Works like cat, except also prints filename and line number for each line
# Useful for grep/egrep
#
# example usage: find . -type f -name "*.po*" -exec ./acat.sh \; |
#                  grep -i "something" | 
#                  grep -vi "exclude something" | tee ../output.txt
#  using 'tee' allows output directly to screen, as well as the specified file

if [ -z "$1" ]; then
    echo "Print lines in a file, printing the filename and line number for each line"
    exit 1
fi

filename="$1"
line_number=0
while IFS='' read -r line || [[ -n $line ]]; do
    line_number=$((line_number+1))
    echo "$filename:$line_number|$line"
done < "$filename"

