# Determine the appropriate non-root user

source ./py-utils.sh

install_user_package \
    torch torchvision torchaudio --extra-index-url ${INDEXURL} \
    xformers
