${PYTHON_PATH}/bin/python -m pip install \
    --user --upgrade --no-cache-dir --index-url ${INDEXURL} \
    numpy \
    huggingface-hub \
    transformers \
    diffusers[torch] \
    accelerate \
    peft \
    optimum \
    xformers