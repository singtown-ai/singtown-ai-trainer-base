FROM nvidia/cuda:13.0.1-cudnn-runtime-ubuntu24.04

RUN apt update && apt install -y libgl1 libglib2.0-0 git curl cmake build-essential && \
    curl -LsSf https://astral.sh/uv/install.sh | sh && \
    rm -rf /var/lib/apt/lists/*

ENV PATH="/root/.local/bin:$PATH"

COPY envs /envs

RUN uv python install 3.12
RUN cd /envs/singtown-ai-rknn2 && uv venv && uv sync
RUN cd /envs/singtown-ai-onnx2tf && uv venv && uv sync
