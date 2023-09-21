apt-add-repository ppa:fish-shell/release-3
apt update
apt install -y --no-install-recommends fish
rm -rf /var/lib/apt/lists/*