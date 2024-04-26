FROM ubuntu:24.04
RUN apt update
RUN apt dist-upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt install -y curl build-essential libssl-dev pkg-config rollup
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH=/root/.cargo/bin:$PATH
RUN rustup target add wasm32-unknown-unknown
RUN cargo install wasm-pack
