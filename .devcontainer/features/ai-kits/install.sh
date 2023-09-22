#!/usr/bin/bash

user_exec() {
    COMMAND="$*"
    su - vscode -c "$COMMAND"
}


user_exec ${PYTHON_PATH}/bin/python3 -m pip install --user --upgrade --no-cache-dir -v \
    --index-url ${INDEXURL} \
    numpy \
    huggingface-hub \
    transformers \
    diffusers[torch] \
    accelerate \
    peft \
    optimum \
    xformers