#!/bin/bash

filename=$1

if [ ! -f "$filename" ]
 then
  touch "$filename"
else
  echo "File: $filename already exist"
fi
