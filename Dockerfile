FROM jupyter/tensorflow-notebook:tensorflow-2.4.1

MAINTAINER Sumanas Sarma <insectatorious+docker@gmail.com>

USER root

COPY install-tf-gpu-requirements.sh .

RUN bash install-tf-gpu-requirements.sh

USER $NB_UID

COPY requirements.txt .

RUN python -m pip install -r requirements.txt
