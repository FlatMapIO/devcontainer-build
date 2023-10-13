#!/usr/bin/bash

CUDA_VERSION="${CUDAVERSION:-12.1}"

user_exec() {
    COMMAND="$*"
    su - vscode -c "$COMMAND"
}


case $CUDA_VERSION in
    "11.8")
        user_exec ${PYTHON_PATH}/bin/python3 -m pip install --user --upgrade --no-cache-dir -v \
            torch==2.0.1+cu118 \
            torchvision==0.15.2+cu118 \
            torchaudio==2.0.2 \
            --index-url https://download.pytorch.org/whl/cu118
        ;;
    "12.1" | "12.2")
        user_exec ${PYTHON_PATH}/bin/python3 -m pip install --user --upgrade --no-cache-dir -v \
            torch torchvision torchaudio
        ;;
    *)
        echo "Unsupported CUDA version: $CUDA_VERSION"
        exit 1
    ;;
esac