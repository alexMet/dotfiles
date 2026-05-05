FROM node:25-bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    ripgrep \
    ca-certificates \
    less \
    procps \
  && rm -rf /var/lib/apt/lists/*

RUN npm install -g @anthropic-ai/claude-code

RUN mkdir -p /work && chmod 777 /work
WORKDIR /work

ENTRYPOINT ["claude"]
