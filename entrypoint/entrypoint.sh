#!/bin/bash --login
set -euo pipefail

set +euo pipefail

PATH=/root/miniconda/bin:$PATH

bash /root/miniconda/etc/profile.d/conda.sh
conda init bash
source /root/.bashrc
conda activate workshop

NB_PASS=$(echo ${SOME_ID} | python3.10 -c 'from jupyter_server.auth import passwd;print(passwd(input()))')

XLA_FLAGS=--xla_gpu_cuda_data_dir=/root/miniconda/envs/workshop
CUDA_VISIBLE_DEVICES=1

set -euo pipefail


# conda run -n workshop jupyter lab --notebook-dir=jupyter --no-browser --ip 0.0.0.0 --port 8888 --NotebookApp.allow_origin='*' --allow-root --NotebookApp.allow_remote_access=True --NotebookApp.quit_button=False --NotebookApp.terminals_enabled=False  --NotebookApp.trust_xheaders=True --NotebookApp.open_browser=False --NotebookApp.password=${NB_PASS}
exec jupyter lab --notebook-dir=jupyter --no-browser --ip 0.0.0.0 --port 8888 --allow-root --NotebookApp.quit_button=False --NotebookApp.terminals_enabled=False  --NotebookApp.trust_xheaders=True --NotebookApp.open_browser=False --NotebookApp.password=${NB_PASS}
