MAX_ITERS=3
NUM_SAMPLES=8
TEMPERATURES="0.0"
TIMEOUT=600
NUM_SHARDS=2
DATASET="minif2f-test"
DATA="data/minif2f.jsonl"

MODEL="open-web-math/llemma_7b"
NAME="llemma7b"

OUTPUT_DIR="output/${NAME}_minif2f_test"

for SHARD in 2 3
do
  CUDA_VISIBLE_DEVICES=${SHARD} python proofsearch.py --dataset-name ${DATASET} --temperatures ${TEMPERATURES} --timeout ${TIMEOUT} --num-shards ${NUM_SHARDS} --shard ${SHARD} --model-name ${MODEL} --max-iters ${MAX_ITERS} --dataset-path ${DATA} --num-samples ${NUM_SAMPLES} --early-stop --output-dir ${OUTPUT_DIR} &> ${NAME}_shard${SHARD}_03.out &
done

