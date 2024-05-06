#!/bin/bash

# Define the different few-shot settings you want to test
numshots=(12 16 20 24)

# Loop through each few-shot setting
for num in "${numshots[@]}"
do
    echo "Running evaluation with $num few-shot examples"
    lm_eval --model hf \
            --model_args pretrained=meta-llama/Meta-Llama-3-8B-Instruct \
            --tasks gsm8k \
            --device cuda:0 \
            --num_fewshot $num \
            --limit=5000 \
            --batch_size 2
done
