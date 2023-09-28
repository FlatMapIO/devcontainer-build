su vscode -c /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

ln -s /home/linuxbrew/.linuxbrew /opt/homebrew

export PATH="/opt/homebrew/bin:$PATH"

brew install git git-lfs fish lsd bat htop aria2 fd ripgrep nvim

brew cleanup  --prune=all

ls -l /opt/homebrew/Cellar