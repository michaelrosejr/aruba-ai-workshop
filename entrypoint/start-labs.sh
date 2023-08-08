#!/bin/bash
set -e
NB_PASS=$(echo ${SOME_ID} | python3.10 -c 'from notebook.auth import passwd;print(passwd(input()))')


jupyter lab --notebook-dir=jupyter --no-browser --ip 0.0.0.0 --port 8888 --NotebookApp.allow_origin='*' --allow-root --NotebookApp.allow_remote_access=True --NotebookApp.quit_button=False --NotebookApp.terminals_enabled=Fals
e  --NotebookApp.trust_xheaders=True --NotebookApp.open_browser=False --NotebookApp.password=${NB_PASS}
