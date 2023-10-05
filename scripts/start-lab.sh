# Set password for Jupyter Lab
scripts/gen_jupyter_auth.py -p $1
# NB_PASS=$(echo $1 | python -c 'from jupyter_server.auth import passwd;print(passwd(input()))')

INSTANCE_ID=`curl http://169.254.169.254/latest/meta-data/instance-id`
LABID=$2
LABNUMBER=$3
Node_Name=$4

JSON_FMT='{"instance_id": "%s", "lab_id": "%s", "lab_number": "%s", "node_name": "%s"}'
printf "$JSON_FMT" "$INSTANCE_ID" "$LABID" "$LABNUMBER" "$Node_Name"> ~/health_check/html/index.json

export XLA_FLAGS=--xla_gpu_cuda_data_dir=/home/ubuntu/miniconda3/envs/workshop
#export CUDA_VISIBLE_DEVICES=1
export TF_CPP_MIN_LOG_LEVEL=2

# Moved to Jupyter config file: /home/ubuntu/.jupyter/jupyter_server_config.py
# jupyter lab --notebook-dir=. --no-browser --ip 0.0.0.0 --port 8888 --allow-root --NotebookApp.quit_button=False --NotebookApp.terminals_enabled=False --NotebookApp.trust_xheaders=True --NotebookApp.open_browser=False --NotebookApp.password=${NB_PASS}
#
jupyter lab 
