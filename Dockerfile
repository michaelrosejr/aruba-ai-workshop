FROM python:3.10.13

USER 0
RUN apt-get update
# RUN apt-get install -y graphviz
# RUN apt-get install -y ffmpeg 
RUN apt-get install -y vim-tiny
RUN apt-get install -y libsm6 libxext6
RUN apt-get install -y libgl1

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
RUN bash ~/miniconda.sh -b -p $HOME/miniconda

ENV PATH="/root/miniconda/bin:${PATH}"
ENV XLA_FLAGS=--xla_gpu_cuda_data_dir=/root/miniconda/envs/workshop

# RUN conda install -c conda-forge -y cudatoolkit=11.8.0
# RUN conda install -c conda-forge -y graphviz 
# RUN conda install -c conda-forge -y ffmpeg
# RUN conda install -c conda-forge -y ncurses
# RUN python3 -m pip install nvidia-cudnn-cu11==8.6.0.163 tensorflow==2.13.*
RUN mkdir /root/.jupyter
COPY .jupyter /root/.jupyter
COPY requirements.txt requirements.txt
COPY environment.yml environment.yml
RUN conda env create -f environment.yml
RUN echo "conda activate $(head -1 environment.yml | cut -d' ' -f2)" >> ~/.bashrc
ENV PATH /root/miniconda/envs/$(head -1 environment.yml | cut -d' ' -f2)/bin:$PATH

ENV CONDA_DEFAULT_ENV $(head -1 environment.yml | cut -d' ' -f2)

RUN python3.10 -m pip install jupyter_server
SHELL ["conda", "run", "-n", "workshop", "/bin/bash", "-c"]
RUN mkdir -p $CONDA_PREFIX/etc/conda/activate.d
RUN echo 'CUDNN_PATH=$(dirname $(python -c "import nvidia.cudnn;print(nvidia.cudnn.__file__)"))' >> $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh
RUN echo 'export LD_LIBRARY_PATH=$CUDNN_PATH/lib:$CONDA_PREFIX/lib/:$LD_LIBRARY_PATH' >> $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh
RUN source $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh

RUN mkdir -p /usr/src/app/jupyter

WORKDIR /usr/src/app

# COPY requirements.txt requirements.txt
COPY entrypoint/entrypoint.sh .
RUN chmod +x entrypoint.sh
# Moved to anaconda
# doesnt' work due to pip version of requirements.txt
#- RUN conda install --force-reinstall -y -q --name workshop -c conda-forge --file requirements.txt
# RUN pip install -r requirements.txt
# RUN pip install scikit-learn
# RUN pip install opencv-python
# RUN pip jupyterlab-spellchecker

EXPOSE 8888

# Needed to suppress warnings with tensorflow and GPU
ENV TF_CPP_MIN_LOG_LEVEL=2


ENTRYPOINT ["./entrypoint.sh"]
