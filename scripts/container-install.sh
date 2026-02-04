#!/bin/bash

apt-get update && apt-get -y install python3.10 python3-pip openmpi-bin libopenmpi-dev
pip3 install MaverIQ/environment/nvidia_ammo-0.7.4.post1-py3-none-any.whl
pip3 install tensorrt_llm==0.9.0.dev2024022000 -U --pre --extra-index-url https://pypi.nvidia.com
pip3 install -r MaverIQ/TensorRT-LLM/requirements_MaverIQ.txt

python -m pip uninstall -y cuda || true
python -m pip install --no-cache-dir "cuda-python>=12,<13"

export OMPI_ALLOW_RUN_AS_ROOT=1
export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1

LOCATION=$(pip3 show tensorrt_llm | awk -F': ' '/^Location/ {print $2}')
cp -r MaverIQ/TensorRT-LLM/tensorrt_llm "$LOCATION/"
