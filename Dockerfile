FROM jupyter/tensorflow-notebook:tensorflow-2.4.1

MAINTAINER Sumanas Sarma <insectatorious+docker@gmail.com>

COPY requirements.txt .

RUN python -m pip install -r requirements.txt
