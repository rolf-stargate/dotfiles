#!/bin/bash

arr1=( $* )
arr2=( "$@" )

for (( i=0; i < ${#arr1[@]}; i++ )); do
  echo ${arr1[i]}
done

for (( i=0; i < ${#arr2[@]}; i++ )); do
  echo ${arr2[i]}
done

