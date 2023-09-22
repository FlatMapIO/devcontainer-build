#!/usr/bin/bash

su vscode

${PYTHON_PATH}/bin/python3 -m pip install --user --upgrade --no-cache-dir -v \
    torch torchvision torchaudio --extra-index-url "${INDEXURL}" \
    xformers
