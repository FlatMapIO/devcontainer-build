FROM nvidia/cuda:11.8.0-devel-ubuntu22.04 as base

RUN apt update

RUN apt-get install -y \
    software-properties-common \
    wget \
    curl \
    git \
    build-essential \
    zlib1g \
    python3-dev \
    python3-pip \
    python3-wheel \
    python3-setuptools

FROM base as cuda

ENV CUDNN_VERSION="8.9.5.*"
ENV CUDA_VERSION="cuda11.8"
ENV DISTRO="ubuntu2204"
ENV ARCH="x86_64"

WORKDIR /work

RUN wget https://developer.download.nvidia.com/compute/cuda/repos/${DISTRO}/${ARCH}/cuda-archive-keyring.gpg \
        -O /usr/share/keyrings/cuda-archive-keyring.gpg; \
    echo "deb [signed-by=/usr/share/keyrings/cuda-archive-keyring.gpg] https://developer.download.nvidia.com/compute/cuda/repos/${DISTRO}/${ARCH}/ /" | tee /etc/apt/sources.list.d/cuda-${DISTRO}-${ARCH}.list; \
    wget https://developer.download.nvidia.com/compute/cuda/repos/${DISTRO}/${ARCH}/cuda-<distro>.pin \
        -O /etc/apt/preferences.d/cuda-repository-pin-600; \
    apt-get update; \
    apt-get install libcudnn8=${CUDNN_VERSION}-1+${CUDA_VERSION}; \
    apt-get install libcudnn8-dev=${CUDNN_VERSION}-1+${CUDA_VERSION}

FROM cuda as torch

WORKDIR /work

COPY ./requirements/ ./requirements/
RUN pip3 install -r ./requirements/torch.txt

FROM torch as devel

RUN pip3 install -r ./requirements/pip.txt