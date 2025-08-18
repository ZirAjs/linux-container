FROM ubuntu:18.04@sha256:f08638ec7ddc90065187e7eabdfac3c96e5ff0f6b2f1762cf31a4f49b53000a5

ENV USER=user
ENV DEBUG_PORT=6000
ENV TERM=xterm-256color

RUN adduser --disabled-password "$USER"

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      tmux \
      gdb \
      python3 \
      python3-pip \
      curl \
      nano \
      vim \
      rubygems \
      ruby-dev \
      tree \
      git \
      zsh \
      adduser \
      gdbserver \
      gdb-multiarch \
      xz-utils \
 && rm -rf /var/lib/apt/lists/*

# download libc source
RUN mkdir -p /usr/src/glibc && \
    curl -L https://ftp.gnu.org/gnu/glibc/glibc-2.27.tar.xz -o /usr/src/glibc/glibc-2.27.tar.xz && \
    cd /usr/src/glibc && \
    tar -xf glibc-2.27.tar.xz
    

RUN find /usr/src/glibc/glibc-2.27 -type d \
    -exec echo "directory {}" \; >> /root/.gdbinit && \
    find /usr/src/glibc/glibc-2.27 -type d \
    -exec echo "directory {}" \; >> "/home/${USER}/.gdbinit"

# Upgrade pip and setuptools and install setuptools_rust explicitly
RUN pip3 install --upgrade pip 

# Now install pwntools
RUN pip3 install pwntools

# Install gems
RUN gem install elftools -v 1.1.3
RUN gem install one_gadget -v 1.9.0

# Clone and setup pwndbg
RUN git clone https://github.com/pwndbg/pwndbg /pwndbg && \
    cd /pwndbg && \
    git checkout 2023.07.17 && \
    ./setup.sh

# Set zsh as default shell for root
RUN chsh -s /usr/bin/zsh root

COPY .zshrc /root/.zshrc
COPY .zshrc "/home/${USER}/.zshrc"
COPY .tmux.conf /root/.tmux.conf
COPY .tmux.conf "/home/${USER}/.tmux.conf"
COPY .vimrc /root/.vimrc
COPY .vimrc "/home/${USER}/.vimrc"


ENV LC_CTYPE=C.UTF-8

WORKDIR "/home/$USER"
USER "$USER"

EXPOSE $DEBUG_PORT
