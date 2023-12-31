FROM docker.io/library/ubuntu:20.04
RUN export TZ="America/Chicago" && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo "$TZ" > /etc/timezone && \
    apt-get update && \
    apt-get install --no-install-recommends -y sudo build-essential libsqlite3-dev libboost-all-dev libssl-dev git python3-setuptools castxml ca-certificates && \    
    apt-get autoremove -y && \
    apt-get autoclean  -y && \
    mkdir ndnSIM && \
    cd ndnSIM && \
    git config --global http.version HTTP/1.1 && \
    git clone https://github.com/named-data-ndnSIM/ns-3-dev.git ns-3 && \
    git clone https://github.com/named-data-ndnSIM/pybindgen.git pybindgen && \
    git clone --recursive https://github.com/named-data-ndnSIM/ndnSIM.git ns-3/src/ndnSIM && \    
    rm -rf "$(find . -name '.git*')" && \
    rm -rf "$(find . -name 'doc' -type d)" && \
    rm -rf "$(find . -name 'docs' -type d)" && \    
    cd ns-3 && \
    ./waf configure -d debug --disable-python --enable-examples
WORKDIR /ndnSIM/ns-3
CMD [ "/bin/bash" ]
