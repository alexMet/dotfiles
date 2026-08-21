FROM node:25-bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    ripgrep \
    ca-certificates \
    less \
    procps \
    python3 \
    python3-pip \
    python3-venv \
    curl \
    build-essential \
  && rm -rf /var/lib/apt/lists/*

ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
      | sh -s -- -y --no-modify-path --default-toolchain stable \
 && rustup toolchain install stable \
 && chmod -R a+rwX "$RUSTUP_HOME" "$CARGO_HOME"

RUN mkdir -p /work && chmod 777 /work
WORKDIR /work

RUN npm install -g @anthropic-ai/claude-code

ENTRYPOINT ["claude"]
