#!/usr/bin/bash

user_exec() {
    COMMAND="$*"
    su - vscode -c "$COMMAND"
}


user_exec ${PYTHON_PATH}/bin/python3 -m pip install --user --upgrade --no-cache-dir -v \
    ipywidgets \
    torch torchvision torchaudio --extra-index-url "${INDEXURL}" \
    xformers
