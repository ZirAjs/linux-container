FROM FROM ubuntu:22.04

ENV USER=user
ENV DEBUG_PORT=6000
ENV TERM=xterm-256color

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
      curl \
      zsh \
      binutils-multiarch \
      adduser \
      glibc-source \
 && rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password  "$USER"


RUN cd /usr/src/glibc && \
     tar -xf glibc-2.39.tar.xz

RUN find /usr/src/glibc/glibc-2.39 -type d \
    -exec echo "directory {}" \; >> /root/.gdbinit && \
    find /usr/src/glibc/glibc-2.39 -type d \
    -exec echo "directory {}" \; >> /home/${USER}/.gdbinit

RUN pip install --break-system-packages pwntools
RUN gem install  one_gadget
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


