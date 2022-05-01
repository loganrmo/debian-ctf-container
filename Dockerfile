FROM debian:bullseye

ARG PYTHON_VERSION=3.9.2-3
ARG USERNAME=rm
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /tmp

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    apt-transport-https \
    bash \
    bash-completion \
    binutils \
    build-essential \
    ca-certificates \
    curl \ 
    git \
    gnupg \
    libbz2-dev \
    libffi-dev \
    libgmp-dev \ 
    libpcap-dev \
    libssl-dev \
    lsb-release \
    netcat \
    openssh-server \
    pkg-config \
    python3 \
    python3-dev \
    python3-pip \
    software-properties-common \
    sudo \
    tcpdump \
    tshark \
    unzip \
    vim \
    wget \
    yasm \
    zlib1g-dev

RUN pip install pypykatz pwntools

RUN useradd -rm -d /home/${USERNAME} -s /bin/bash -G sudo -u 1001 -p JkqZWdvHiO44w ${USERNAME}
RUN chown -R ${USERNAME} /home/${USERNAME}


WORKDIR /home/${USERNAME}
RUN git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap
RUN git clone https://github.com/openwall/john -b bleeding-jumbo john && cd john/src && ./configure && make -s clean && make -sj4

USER ${USERNAME}
RUN curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
RUN export NVM_DIR="$HOME/.nvm" && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && nvm install node

WORKDIR /home/${USERNAME}
CMD [ "/bin/bash", "-l", "-c" ]
