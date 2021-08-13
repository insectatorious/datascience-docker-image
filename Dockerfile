#FROM ubuntu:18.04
FROM krallin/ubuntu-tini:bionic

MAINTAINER Sumanas Sarma <insectatorious+docker@gmail.com>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
        build-essential \
        libblas-dev \
	    checkinstall \
	    liblapacke-dev \
	    checkinstall \
	    liblapack-doc \
	    checkinstall \
	    curl \
	    gfortran \
#        python3-dev \
#        python3-pip \
        software-properties-common

RUN add-apt-repository ppa:deadsnakes/ppa && apt-get update
RUN apt-get install -y python3.8 python3.8-dev python3.8-distutils python3.8-venv

RUN echo $(python3.8 -V)
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3.8 get-pip.py


COPY requirements.txt .

RUN python3.8 -m pip --no-cache-dir install -r requirements.txt

RUN mkdir -p /src/notebooks
WORKDIR /src/notebooks

EXPOSE 8888

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
