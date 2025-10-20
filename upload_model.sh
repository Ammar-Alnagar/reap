#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <model_name> <huggingface_username> <huggingface_token>"
    exit 1
fi

MODEL_NAME=$1
HF_USERNAME=$2
HF_TOKEN=$3

source .venv/bin/activate

# Login to Hugging Face Hub
huggingface-cli login --token "$HF_TOKEN"

# Path to the merged model directory
MERGED_MODEL_DIR="./artifacts/$MODEL_NAME"

# Check if the directory exists
if [ ! -d "$MERGED_MODEL_DIR" ]; then
    echo "Error: Directory '$MERGED_MODEL_DIR' not found."
    exit 1
fi

# Create a repository on the Hugging Face Hub and upload the model
huggingface-cli repo create "$HF_USERNAME/$MODEL_NAME" --exist-ok
huggingface-cli upload "$HF_USERNAME/$MODEL_NAME" "$MERGED_MODEL_DIR" .

echo "Model '$MODEL_NAME' uploaded successfully to '$HF_USERNAME/$MODEL_NAME'."
