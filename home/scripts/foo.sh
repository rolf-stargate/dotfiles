#!/bin/bash

echo $1

if [ -t $1 ]; then
  echo "yes"
else
  echo "no"
fi
