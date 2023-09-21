## Featurs
- https://github.com/devcontainers/features/tree/main/src/nvidia-cuda
- https://github.com/devcontainers/features/tree/main/src/python
- https://github.com/devcontainers/features/tree/main/src/git
- Pytorch CUDA 11.8
- AI Kits

## Usage

```bash
docker pull huodon/pytorch-devcontainer:118

git clone --depth 1 git@github.com:FlatMapIO/pytorch-devcontainer.git my-repo
cd my-repo
rm .git
```

## Build

```bash
npm install -g @devcontainers/cli

devcontainer build \
    --workspace-folder . \
    --config ./.devcontainer/vscode-pytorch-image.jsonc \
    --image-name huodon/pytorch-devcontainer:118
```


## Links
- https://hub.docker.com/r/huodon/pytorch-devcontainer/tags
- https://mirrors.tuna.tsinghua.edu.cn/help/pypi/
- [配置 nvidia container toolkit](./docs/ubuntu-nvidia-container.md)
