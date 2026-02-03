#!/bin/bash

sudo nvidia-smi -i 0,1,2,3 -mig 0
docker build -t maveriq /home/cc/MaverIQ/environment
docker run --rm --runtime=nvidia --gpus all --shm-size=10.24gb --entrypoint /bin/bash -it maveriq
