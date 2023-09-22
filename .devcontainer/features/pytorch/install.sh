${PYTHON_PATH}/bin/python -m pip install \
    --user --upgrade --no-cache-dir -v \
    torch torchvision torchaudio --extra-index-url ${INDEXURL} \
    xformers
