#!/bin/bash

echo $1

if [ -t "$1" ]; then
  echo $?
  echo "yes"
else
  echo $?
  echo "no"
fi
