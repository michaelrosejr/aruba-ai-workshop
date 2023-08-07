FROM python:3.10

USER 0
RUN mkdir -p /usr/src/app/jupyter
WORKDIR /usr/src/app

COPY requirements.txt requirements.txt
COPY entrypoint/start-labs.sh .
RUN chmod +x start-labs.sh
RUN pip install -r requirements.txt
RUN pip install scikit-learn

EXPOSE 8888

# Needed to suppress warnings with tensorflow and GPU
ENV TF_CPP_MIN_LOG_LEVEL=2


#ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.allow_origin=*", "--NotebookApp.allow_remote_access=1"]
ENTRYPOINT ["./start-labs.sh"]
