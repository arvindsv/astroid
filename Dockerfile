FROM ubuntu:cosmic

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    ca-certificates \
    git \
    g++ \
    libnotmuch-dev \
    libglibmm-2.4-dev \
    libgtkmm-3.0-dev \
    libwebkit2gtk-4.0-dev \
    libgmime-2.6-dev \
    libsass-dev \
    libpeas-dev \
    libgirepository1.0-dev \
    libboost-all-dev \
    protobuf-compiler \
    ronn \
    cmake \
    libgmime-3.0-dev \
    libprotobuf-dev \
    vim-gtk3 \
    cmark \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/astroidmail/astroid.git \
    && cd astroid \
    && cmake -H. -Bbuild -DCMAKE_INSTALL_PREFIX=/usr/local \
    && cmake --build build --target install

ENTRYPOINT [ "/usr/local/bin/astroid" ]
