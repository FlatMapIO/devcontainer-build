import torch

info = {
  'is_cuda_available': torch.cuda.is_available(),
}


print(info)