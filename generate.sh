BASE_MODEL="../llama-7b-hf"
LORA_PATH="lora-Vicuna/20230424" #"./lora-Vicuna/checkpoint-final"
USE_LOCAL=1 # 1: use local model, 0: use huggingface model
TYPE_WRITER=1 # whether output streamly
if [[ USE_LOCAL -eq 1 ]]
then
cp ./config-sample/adapter_config.json $LORA_PATH
fi
CUDA_VISIBLE_DEVICES=0 python generate.py \
    --model_path $BASE_MODEL \
    --lora_path $LORA_PATH \
    --use_local $USE_LOCAL \
    --use_typewriter $TYPE_WRITER