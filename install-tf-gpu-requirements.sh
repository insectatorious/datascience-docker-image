#!/bin/bash

# See https://www.tensorflow.org/install/gpu#ubuntu_1804_cuda_110

# Add NVIDIA package repositories
apt-get update
apt-get install -y software-properties-common
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu2004/x86_64/7fa2af80.pub
apt-get update
apt-get install -y apt-utils

wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu2004/x86_64/nvidia-machine-learning-repo-ubuntu2004_1.0.0-1_amd64.deb

apt-get install -y ./nvidia-machine-learning-repo-ubuntu2004_1.0.0-1_amd64.deb
apt-get update

#wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu2004/x86_64/libnvinfer7_7.1.3-1+cuda11.0_amd64.deb
#apt-get install -y ./libnvinfer7_7.1.3-1+cuda11.0_amd64.deb
#apt-get update

# Install development and runtime libraries (~4GB)
apt-get install --no-install-recommends -y \
    cuda \
    libcudnn8  \
    libcudnn8-dev

apt-mark manual cuda* python* libcudnn8 nvidia* nsight* libcu* libcudnn8-dev


apt-get remove -y software-properties-common build-essential apt-utils
apt-get -y autoremove

rm ./nvidia-machine-learning-repo-ubuntu2004_1.0.0-1_amd64.deb
