source ./py-utils.sh

install_user_package \
    --index-url ${INDEXURL} \
    numpy \
    huggingface-hub \
    transformers \
    diffusers[torch] \
    accelerate \
    peft \
    optimum \
    xformers