## 需求
- 保证 Docker 已经安装

## 安装

```bash

curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey \
| sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg

curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list \
| sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' \
| sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

sudo apt update

sudo apt install -y nvidia-container-toolkit
```

## 配置

```bash
# 以下命令会改写或创建 /etc/docker/daemon.json 文件

sudo nvidia-ctk runtime configure --runtime=docker

# 重启 docker daemon
sudo systemctl restart docker
```

## 验证
```bash
docker run --rm --runtime=nvidia --gpus all ubuntu nvidia-smi
```