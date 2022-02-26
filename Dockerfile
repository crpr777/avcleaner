FROM debian
RUN echo "root:root" | chpasswd
RUN useradd -m -s /bin/bash toto \
        && echo "toto:toto" | chpasswd
RUN usermod -aG sudo toto
RUN apt update && apt install -y git sudo vim golang build-essential libstdc++5 clang libclang-dev llvm llvm-runtime cmake
RUN echo -e "%wheel ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/99_wheel

USER toto
WORKDIR /home/toto

