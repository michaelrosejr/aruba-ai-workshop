FROM python:3.10

USER 0
RUN mkdir -p /usr/src/app/jupyter
WORKDIR /usr/src/app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN pip install scikit-learn

EXPOSE 8888

ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.allow_origin=*", "--NotebookApp.allow_remote_access=1"]