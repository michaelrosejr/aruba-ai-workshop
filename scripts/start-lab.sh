NB_PASS=$(echo $1 | python -c 'from jupyter_server.auth import passwd;print(passwd(input()))')

export XLA_FLAGS=--xla_gpu_cuda_data_dir=/home/ubuntu/miniconda3/envs/workshop
#export CUDA_VISIBLE_DEVICES=1
export TF_CPP_MIN_LOG_LEVEL=2

jupyter lab --notebook-dir=. --no-browser --ip 0.0.0.0 --port 8888 --allow-root --NotebookApp.quit_button=False --NotebookApp.terminals_enabled=False --NotebookApp.trust_xheaders=True --NotebookApp.open_browser=False --NotebookApp.password=${NB_PASS}
