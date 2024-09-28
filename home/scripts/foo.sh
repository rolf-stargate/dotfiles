#!/bin/bash

for FILE in /home/rolf/foo/*; do
  echo "${FILE}"
  TEST="${FILE##*/}"
  echo $TEST
done
