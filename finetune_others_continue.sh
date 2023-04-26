TOT_CUDA="0,1"
CUDAs=(${TOT_CUDA//,/ })
CUDA_NUM=${#CUDAs[@]}
PORT="12345"


DATA_PATH="./sample/merge_sample.json" #"../dataset/instruction/guanaco_non_chat_mini_52K-utf8.json" #"./sample/merge_sample.json"
OUTPUT_PATH="lora-Vicuna/20230424"
MODEL_PATH="../llama-7b-hf"
lora_checkpoint="./lora-Vicuna/checkpoint-11600"
from_data_beginning=True # False
TEST_SIZE=1

CUDA_VISIBLE_DEVICES=${TOT_CUDA} torchrun --nproc_per_node=$CUDA_NUM --master_port=$PORT finetune.py \
--data_path $DATA_PATH \
--output_path $OUTPUT_PATH \
--model_path $MODEL_PATH \
--eval_steps 200 \
--save_steps 200 \
--test_size $TEST_SIZE \
--resume_from_checkpoint $lora_checkpoint \
--ignore_data_skip $from_data_beginning
