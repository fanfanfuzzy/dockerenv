FROM pytorch/pytorch:2.1.2-cuda11.8-cudnn8-runtime

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages for Group Equivariant Networks
RUN pip3 install \
    jupyter \
    matplotlib \
    numpy \
    torch-geometric \
    e2cnn \
    tqdm

# Create working directory and setup code
WORKDIR /workspace
RUN git clone https://github.com/senad96/Group-Equivariant-Networks.git /workspace/group-equivariant-networks

# Set Python path to include the project
ENV PYTHONPATH="${PYTHONPATH}:/workspace/group-equivariant-networks"

# Copy test files
COPY test_pytorch.py test_cuda.py /workspace/

# Expose Jupyter port
EXPOSE 8888

# Command to start Jupyter
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
