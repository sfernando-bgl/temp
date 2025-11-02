#!/bin/bash

SPCIFIED_DATE=2022-04-12
SPCIFIED_TIME=13:00:00
URL='https://raw.githubusercontent.com/BGLCorp/devops-interview-tests/refs/heads/main/ec2-instances.csv?token=GHSAT0AAAAAADJRXY3RD6Q4H2QZDY74FEAI2IHLAFA'

while IFS= read -r i; do
  
  EC2_TIME=$(echo "$i" | cut -d',' -f2 | cut -d' ' -f1)
  EC2_DATE=$(echo "$i" | cut -d',' -f2 | cut -d' ' -f2)

  if [[ "$EC2_DATE" < "$SPCIFIED_DATE" ]] || { [[ "$EC2_DATE" == "$SPCIFIED_DATE" ]] && [[ "$EC2_TIME" < "$SPCIFIED_TIME" ]]; }; then
    echo "$i"
  fi
done < <(curl -sL "$URL")

