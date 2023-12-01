#!/bin/bash

rm output
while read -r line; do
  for (( i=0; i<${#line}; i++ )); do
    char=$(echo ${line:i:1})
    num=""
    if [ "$char" -eq "$char" ] 2> /dev/null; then
      num="$num$char"
      break
    fi
  done
  enil=$(echo $line | rev)
  for (( i=0; i<${#enil}; i++ )); do
    char=$(echo ${enil:i:1})
    if [ "$char" -eq "$char" ] 2> /dev/null; then
      num="$num$char"
      break
    fi
  done
  echo $num >> output
done < input

sum=0
while read -r number; do
  sum=$((sum+number))
done < output

echo $sum