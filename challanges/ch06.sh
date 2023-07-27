#!/bin/bash


n="$#"

echo "Number of parameters: $n"

for i in $(seq 1 $n); do
  echo "$i) $1"
  shift
done
