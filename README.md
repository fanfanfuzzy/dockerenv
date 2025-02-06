# Group Equivariant Networks Docker Environment

Docker environment for running Group Equivariant Convolutional Neural Networks (G-CNNs) with PyTorch and CUDA support.

## Requirements

- NVIDIA GPU with CUDA support (A6000)
- Docker with NVIDIA Container Runtime
- Docker Compose

## Environment Setup

The environment includes:
- PyTorch with CUDA 11.8 and cuDNN 8
- Group Equivariant Networks implementation
- Jupyter Notebook for development
- Required Python packages (torch-geometric, e2cnn)

## Usage

1. Build and start the container:
```bash
docker compose up
```

2. Access Jupyter Notebook:
- Open the URL displayed in the console (typically http://localhost:8888)
- The workspace contains the Group Equivariant Networks implementation

3. Test CUDA Support:
```bash
docker exec group-equivariant-net python /workspace/test_cuda.py
```

## Data Directory

Place your Fermi surface image data in the `./data` directory. It will be mounted at `/workspace/data` inside the container.

## Environment Testing

The environment includes test scripts:
- `test_cuda.py`: Verifies PyTorch CUDA support
- `test_pytorch.py`: Basic PyTorch installation test
