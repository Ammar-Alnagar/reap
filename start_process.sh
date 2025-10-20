#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <model_name>"
  exit 1
fi

MODEL_NAME=$1

source .venv/bin/activate
python src/reap/main.py --model_name "$MODEL_NAME"
