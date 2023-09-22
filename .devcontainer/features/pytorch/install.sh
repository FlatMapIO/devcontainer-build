#!/usr/bin/bash

USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

# Determine the appropriate non-root user
if [ "${USERNAME}" = "auto" ] || [ "${USERNAME}" = "automatic" ]; then
    USERNAME=""
    POSSIBLE_USERS=("vscode" "node" "codespace" "$(awk -v val=1000 -F ":" '$3==val{print $1}' /etc/passwd)")
    for CURRENT_USER in "${POSSIBLE_USERS[@]}"; do
        if id -u "${CURRENT_USER}" > /dev/null 2>&1; then
            USERNAME=${CURRENT_USER}
            break
        fi
    done
    if [ "${USERNAME}" = "" ]; then
        USERNAME=root
    fi
elif [ "${USERNAME}" = "none" ] || ! id -u "${USERNAME}" > /dev/null 2>&1; then
    USERNAME=root
fi

if [ "$(id -u)" -eq 0 ] && [ "$USERNAME" != "root" ]; then
    su - "$USERNAME" -c "$COMMAND"
fi


install_user_package() {
    PACKAGE="$1"
    sudo_if "${PYTHON_SRC}" -m pip install --user --upgrade --no-cache-dir "$PACKAGE"
}

install_user_package \
    torch torchvision torchaudio --extra-index-url "${INDEXURL}" \
    xformers
