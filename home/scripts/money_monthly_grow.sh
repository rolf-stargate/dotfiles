#!/bin/bash

anlage=$1
percent_year=$2

years=$3
month=$(( $years * 12 ))


result=0
last=0
more_year=0
for (( i=0; i < month; i++ )); do

  # anlage=$(echo "scale=2; $anlage * ( 1 + $percent_year / 12 / 100)" | bc)
  result=$(echo "scale=10; $result * ( 1 + (($percent_year / 12) / 100)) + $anlage" | bc)
  more=$(echo "scale=10; $result - $last - $anlage" | bc)
  echo "$result --> $more"

  last=$result
  more_year=$(echo "scale=10; $more_year + $more" | bc)

  if [ $(( $i % 12 )) = 0 ]; then
    echo "year: $(( $i / 12 + 1 )) --> $more_year"
    more_year=0
  fi
done

