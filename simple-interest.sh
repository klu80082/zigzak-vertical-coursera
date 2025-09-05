#!/usr/bin/env bash
# simple-interest.sh - compute simple interest: SI = P * R * T / 100
# Usage: ./simple-interest.sh <principal> <rate> <time>

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <principal> <annual-rate-percent> <time-years>"
  exit 1
fi

P="$1"
R="$2"
T="$3"

re='^[0-9]+([.][0-9]+)?$'
if ! [[ $P =~ $re ]] || ! [[ $R =~ $re ]] || ! [[ $T =~ $re ]]; then
  echo "Error: All inputs must be non-negative numbers."
  exit 1
fi

SI=$(awk -v p="$P" -v r="$R" -v t="$T" 'BEGIN { printf "%.2f", (p * r * t) / 100 }')
echo "Principal: $P"
echo "Rate (annual %): $R"
echo "Time (years): $T"
echo "Simple Interest: $SI"
