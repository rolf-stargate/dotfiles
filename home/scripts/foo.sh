#!/bin/bash

A=$1

case "$A" in
  A | B)
    echo "AB";;
  C | D)
    echo "CD";;
  *)
    echo "?";;
esac
