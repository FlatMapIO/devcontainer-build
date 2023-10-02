user_exec() {
    COMMAND="$*"
    su - vscode -c "$COMMAND"
}


user_exec /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

ln -s /home/linuxbrew/.linuxbrew /opt/homebrew

user_exec /opt/homebrew/bin/brew install \
    git git-lfs \
    fish lsd bat htop aria2 fd \
    ripgrep difftastic just nvim \
    ffmpeg

user_exec /opt/homebrew/bin/brew cleanup  --prune=all

ls -l /opt/homebrew/Cellar