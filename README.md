## Usage

```bash

mkdir my-pytorch-project;
cd my-pytorch-project

/bin/bash -c "$(curl -fsSL https://dub.sh/pytorch-devcontainer)"


```
> Execute `./scripts/up.sh` to keep up to date


Add recipe to fish config:

Put `alias create-pytorch-devcontainer /bin/bash -c "$(curl -fsSL https://dub.sh/pytorch-devcontainer)"`
to `~/.config/fish/config.fish`

## Changes


- [2022年 10月 10日 星期二 15:32:36 CST] 不再 pyturch feature 层中安装额外库， xformers 等库还需要时间适配 pytorch 1.1, 这些库转移到应用层构建时安装:
```Dockerfile
FROM huodon/pytorch-devcontainer:118

USER vscode
RUN pip install --no-cache-dir \
    ipywidgets \
    xformers==0.0.22'
```

## Build customized image

```bash
npm install -g @devcontainers/cli

# update vscode-pytorch-image.jsonc

devcontainer build \
    --workspace-folder . \
    --config .devcontainer/pytorch-devcontainer.jsonc \
    --image-name huodon/pytorch-devcontainer:dev

docker tag huodon/pytorch-devcontainer:dev huodon/pytorch-devcontainer:118
```

## Links
- https://hub.docker.com/r/huodon/pytorch-devcontainer/tags
- https://mirrors.tuna.tsinghua.edu.cn/help/pypi/
- [配置 nvidia container toolkit](./docs/ubuntu-nvidia-container.md)


