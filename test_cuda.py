import torch
import e2cnn
import torch_geometric
import numpy as np
from tqdm import tqdm

def test_environment():
    print("Environment Test Results:")
    print("-" * 50)
    
    print("PyTorch Version:", torch.__version__)
    print("CUDA Available:", torch.cuda.is_available())
    if torch.cuda.is_available():
        print("CUDA Device:", torch.cuda.get_device_name(0))
        
    print("\nRequired Packages:")
    print("e2cnn Version:", e2cnn.__version__)
    print("PyTorch Geometric Version:", torch_geometric.__version__)
    print("NumPy Version:", np.__version__)
    
    # Test CUDA tensor operations if available
    if torch.cuda.is_available():
        print("\nTesting CUDA Tensor Operations:")
        x = torch.randn(1000, 1000).cuda()
        y = torch.randn(1000, 1000).cuda()
        for _ in tqdm(range(100)):
            z = torch.matmul(x, y)

if __name__ == "__main__":
    test_environment()
