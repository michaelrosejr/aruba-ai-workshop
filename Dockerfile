FROM python:3.10.13

USER 0
RUN apt-get update
RUN apt-get install -y graphviz
RUN apt-get install -y ffmpeg 
RUN apt-get install -y libsm6 libxext6
RUN mkdir -p /usr/src/app/jupyter
WORKDIR /usr/src/app

COPY requirements.txt requirements.txt
COPY entrypoint/start-labs.sh .
RUN chmod +x start-labs.sh
RUN pip install -r requirements.txt
# RUN pip install scikit-learn
# RUN pip install opencv-python
# RUN pip jupyterlab-spellchecker

EXPOSE 8888

# Needed to suppress warnings with tensorflow and GPU
ENV TF_CPP_MIN_LOG_LEVEL=2


#ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.allow_origin=*", "--NotebookApp.allow_remote_access=1"]
ENTRYPOINT ["./start-labs.sh"]
