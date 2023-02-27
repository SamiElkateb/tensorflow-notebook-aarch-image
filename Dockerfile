# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG OWNER=jupyter
ARG BASE_CONTAINER=$OWNER/scipy-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

# Fix: https://github.com/hadolint/hadolint/wiki/DL4006
# Fix: https://github.com/koalaman/shellcheck/wiki/SC3014
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
USER root

# RUN apt-get update && apt-get upgrade -y
# RUN apt-get install curl -y
# RUN curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
# RUN bash Mambaforge-$(uname)-$(uname -m).sh -b
# RUN mamba config --set auto_activate_base false
# RUN mamba install --quiet --yes \
#     -c apple tensorflow-deps \
#     # mamba install --quiet --yes \
#     # 'tensorflow' && \
#     pip install tensorflow-macos \
#     pip install tensorflow-metal \
#     mamba clean --all -f -y && \
#     fix-permissions "${CONDA_DIR}" && \
#     fix-permissions "/home/${NB_USER}"


# Install Tensorflow
RUN pip install tensorflow-aarch64
# RUN mamba install --quiet --yes \
#     -c conda-forge 'tensorflow' && \
#     # 'tensorflow' && \
#     mamba clean --all -f -y && \
#     fix-permissions "${CONDA_DIR}" && \
#     fix-permissions "/home/${NB_USER}"


RUN mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

