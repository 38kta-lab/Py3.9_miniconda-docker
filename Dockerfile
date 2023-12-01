FROM --platform=linux/amd64 ubuntu:22.04

ENV PATH ~/miniconda3/bin:$PATH
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y && apt install -y \
 build-essential \
 bzip2 \
 wget \
 cmake \
 git \
 gcc \
 make && apt clean

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-py39_23.10.0-1-Linux-x86_64.sh -O ~/Miniconda.sh && \
 /bin/bash ~/Miniconda.sh -b -p ~/miniconda3 && \
 rm ~/Miniconda.sh && \
 echo ". ~/miniconda3/etc/profile.d/conda.sh" >> ~/.bashrc && \
 echo "conda activate base" >> ~/.bashrc

RUN ~/miniconda3/bin/conda install -c conda-forge mamba -yq && ~/miniconda3/bin/mamba clean -a -y

SHELL ["/bin/bash", "-c"]
WORKDIR /home