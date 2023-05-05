FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y\
  vim neovim nano \
  git git-lfs \
  zip unzip \
  curl make build-essential xz-utils file tree \
  sudo \
  libssl-dev pkg-config \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/

# Install Rust
RUN apt-get update \
  && apt-get install -y curl \
  && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y \
  && . $HOME/.cargo/env \
  && rustup update

# Set environment variables
ENV PATH="/root/.cargo/bin:${PATH}"

WORKDIR /main
