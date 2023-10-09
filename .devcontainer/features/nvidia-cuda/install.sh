#!/usr/bin/env bash

set -e

# Clean up
rm -rf /var/lib/apt/lists/*

if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

DISTRO=ubuntu2204
ARCH=x86_64

CUDA_KEYRING=cuda-keyring_1.1-1_all.deb
wget https://developer.download.nvidia.com/compute/cuda/repos/$DISTRO/$ARCH/$CUDA_KEYRING
sudo dpkg -i $CUDA_KEYRING
rm $CUDA_KEYRING
echo "deb [signed-by=/usr/share/keyrings/cuda-archive-keyring.gpg] https://developer.download.nvidia.com/compute/cuda/repos/$DISTRO/$ARCH/ /" > /etc/apt/sources.list.d/cuda-${DISTRO}-${ARCH}.list

echo "Running apt-get update..."
apt-get update -y

INSTALL_NVTX=${INSTALLNVTX}
INSTALL_TOOLKIT=${INSTALLTOOLKIT}
INSTALL_CUDNN=${INSTALLCUDNN}

CUDA_VERSION=${CUDAVERSION:-12.1}

echo "Installing CUDA-${CUDA_VERSION} libraries..."
apt-get install -yq "cuda-libraries-${CUDA_VERSION/./-}"

if [ "$INSTALL_CUDNN" = "true" ]; then
    CUDNN_VERSION=$(apt-cache policy libcudnn8 | grep "$CUDA_VERSION" | tr -d ' ' | grep -Po '(?<=^).*(?=-1+)' | sort -V | tail -n1)
    echo "Installing CUDNN-${CUDNN_VERSION} libraries..."
    apt-get install -yq libcudnn8=${CUDNN_VERSION}-1+cuda${CUDA_VERSION}
fi



if [ "$INSTALL_NVTX" = "true" ]; then
    nvtx_pkg="cuda-nvtx-${CUDA_VERSION/./-}"
    echo "Installing NVTX..."
    apt-get install -yq "$nvtx_pkg"
fi

if [ "$INSTALL_TOOLKIT" = "true" ]; then
    toolkit_pkg="cuda-toolkit-${CUDA_VERSION/./-}"
    echo "Installing CUDA Toolkit..."
    apt-get install -yq "$toolkit_pkg"
fi

# Clean up
rm -rf /var/lib/apt/lists/*

echo "Done!"