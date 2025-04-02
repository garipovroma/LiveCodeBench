#!/bin/bash

export HF_HOME=/mnt/LLM
export EVAL_FOLDER=...

file1=$EVAL_FOLDER/json/70b_2-workers_2-shots.json
file2=$EVAL_FOLDER/json/70b_baseline_0-shot.json
file3=$EVAL_FOLDER/json/70b_baseline_2-shots.json
file4=$EVAL_FOLDER/json/70b_baseline_lcb_format.json
file5=$EVAL_FOLDER/json/qwq.json

for filename in "$file1" "$file2" "$file3" "$file4" "$file5"
do
	FILE_NAME_WITHOUT_JSON_EXTENSION=$(basename "$filename" .json)
	echo "RUNNING EVAL FOR ${FILE_NAME_WITHOUT_JSON_EXTENSION}"
	python -m lcb_runner.runner.custom_evaluator --custom_output_file "$filename"

	mv $EVAL_FOLDER/json/*_output.json $EVAL_FOLDER/lcb_output/
	mv $EVAL_FOLDER/json/*eval*.json $EVAL_FOLDER/lcb_output/
	mv $EVAL_FOLDER/json/*codegeneration*.json $EVAL_FOLDER/lcb_output/
done



