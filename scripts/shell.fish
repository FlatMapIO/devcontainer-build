#!/usr/bin/env fish

docker run --rm -it \
  --user vscode \
  --gpus all \
  huodon/pytorch-devcontainer:121 bash -c 'python -c "import torch; print({torch_version: torch.__version__, cuda_is_available: torch.cuda.is_available()})"; fish'