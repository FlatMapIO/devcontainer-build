#!/usr/bin/bash

user_exec() {
    COMMAND="$*"
    su - vscode -c "$COMMAND"
}

user_exec ${PYTHON_PATH}/bin/python3 -m pip install --user --upgrade --no-cache-dir -v \
    torch==2.0.1+cu118 \
    torchvision==0.15.2+cu118 \
    torchaudio==2.0.2 \
    --index-url https://download.pytorch.org/whl/cu118

user_exec ${PYTHON_PATH}/bin/python3 -m pip install --user --upgrade --no-cache-dir -v \
    ipywidgets \
    'xformers=0.0.22'

echo "====================================================="
python -m xformers.info
echo "====================================================="