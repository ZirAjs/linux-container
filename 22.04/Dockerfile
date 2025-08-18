FROM ubuntu:22.04

ENV USER=user
ENV DEBUG_PORT=6000
ENV TERM=xterm-256color

RUN adduser --disabled-password --gecos "" "$USER"

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      xz-utils \
      tmux \
      gdb \
      python3 \
      pip \
      nano  \
      vim \
      rubygems \
      ruby-dev \ 
      tree \
      git \
      wget \
      curl \
      binutils-multiarch \
      zsh \
 && rm -rf /var/lib/apt/lists/*

# init glibc-source
RUN mkdir -p /usr/src/glibc && \
    curl -L https://ftp.gnu.org/gnu/glibc/glibc-2.35.tar.xz -o /usr/src/glibc/glibc-2.35.tar.xz && \
    cd /usr/src/glibc && \
    tar -xf glibc-2.35.tar.xz

RUN find /usr/src/glibc/glibc-2.35 -type d \
    -exec echo "directory {}" \; >> /root/.gdbinit && \
    find /usr/src/glibc/glibc-2.35 -type d \
    -exec echo "directory {}" \; >> /home/${USER}/.gdbinit

RUN pip install pwntools
RUN gem install one_gadget
RUN git clone https://github.com/pwndbg/pwndbg && \
        cd pwndbg && \
        ./setup.sh


# Set zsh as default shell for root
RUN chsh -s /usr/bin/zsh root
COPY .zshrc /root/.zshrc
COPY .zshrc "/home/${USER}/.zshrc"

COPY .tmux.conf /root/.tmux.conf
COPY .tmux.conf "/home/${USER}/.tmux.conf"

COPY .vimrc /root/.vimrc
COPY .vimrc "/home/${USER}/.vimrc"

WORKDIR "/home/$USER"
USER "$USER"

EXPOSE $DEBUG_PORT


