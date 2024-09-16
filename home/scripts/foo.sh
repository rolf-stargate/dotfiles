#!/bin/bash

if [ -t $1 ]; then
  echo "yes"
else
  echo "no"
fi
