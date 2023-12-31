FROM docker.io/library/ubuntu:20.04
COPY ./entrypoint.sh /entrypoint.sh
RUN export TZ="America/Chicago" && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo "$TZ" > /etc/timezone && \
    apt-get update && \
    apt-get install --no-install-recommends -y sudo build-essential libsqlite3-dev libboost-all-dev libssl-dev git python3-setuptools castxml ca-certificates && \    
    apt-get install --no-install-recommends -y gir1.2-goocanvas-2.0 gir1.2-gtk-3.0 libgirepository1.0-dev python3-dev python3-gi python3-gi-cairo python3-pip python3-pygraphviz python3-pygccxml && \
    pip3 install kiwi && \
    apt-get autoremove -y && \
    apt-get autoclean  -y
WORKDIR /ndnSIM/ns-3
ENTRYPOINT [ "/bin/bash" , "/entrypoint.sh" ]
