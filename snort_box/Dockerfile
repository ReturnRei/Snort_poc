# Étape 1: Installation des dépendances et compilation de libdaq
FROM ubuntu:23.10 AS builder
RUN apt-get update && apt-get install -y autoconf automake bison build-essential cmake curl flex git libdumbnet-dev libhwloc-dev libhyperscan-dev libluajit-5.1-dev liblzma-dev libpcap-dev libpcre3-dev libssl-dev man-db pkg-config vim zlib1g-dev && apt-get clean
RUN apt install -y vim python3 iproute2 bind9 curl wget iputils-ping vim

RUN git clone https://github.com/snort3/libdaq.git && \
    cd libdaq && \
    ./bootstrap && \
    ./configure && \
    make install && \
    ldconfig && \
    cd ../ && \
    rm -rf libdaq

# Étape 2: Configuration et installation de Snort
FROM builder AS snort-builder
RUN useradd -ms /bin/bash snorty && usermod -aG sudo snorty && apt-get install -y sudo 
USER snorty
WORKDIR /home/snorty
RUN mkdir -p examples snort3 src .vim/syntax .vim/colors && \
    cd src && \
    git clone https://github.com/snort3/snort3.git && \
    cd snort3 && \
    ./configure_cmake.sh --prefix=/home/snorty/snort3 && \
    cd build && \
    make -j$(nproc) install && \
    cd /home/snorty && \
    rm -rf src/ && \
    echo "if [[ ! /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin =~ \$HOME/snort3/bin ]]; then export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:\$HOME/snort3/bin; fi" >> ~/.bashrc && \
    echo "alias snort=\"snort -c \$HOME/snort3/etc/snort/snort.lua\"" >> ~/.bashrc && \
    echo "export TERM=xterm-256color" >> ~/.bashrc && \
    mkdir snort3/etc/rules && \
    cd snort3/etc/rules && \
    curl -LO "https://snort.org/downloads/community/snort3-community-rules.tar.gz" && \
    tar xzf snort3-community-rules.tar.gz snort3-community-rules/snort3-community.rules --strip=1 && \
    rm snort3-community-rules.tar.gz

# Étape 3: Configuration supplémentaire de Snort et lancement
FROM snort-builder 
COPY startup.sh /usr/local/bin/
COPY ffs.rules /home/snorty
USER root
RUN echo 'snorty:snorty' | chpasswd
CMD ["/usr/local/bin/startup.sh"]
#RUN ["/home/snorty/snort3/bin/snort -A console -q -c /home/snorty/snort3/etc/snort/snort.lua -i eth0 -R /home/snorty/ffs.rules -l ./ffs.log -A full"]

/home/snorty/snort3/bin/snort -A console -q -c /home/snorty/snort3/etc/snort/snort.lua -R /home/snorty/ffs.rules