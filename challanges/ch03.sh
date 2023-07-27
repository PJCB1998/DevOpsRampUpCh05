#!/bin/bash

echo "How many numbers would you like to enter?"
read -r n

sum=0

for i in $(seq 1 $n); do
  read -r num
  sum=$((sum + num))
done

average=$((sum / n))

echo "Average: $average"
