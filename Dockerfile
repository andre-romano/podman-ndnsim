FROM docker.io/library/ubuntu:20.04
COPY ./entrypoint.sh /entrypoint.sh
RUN export TZ="America/Chicago" && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo "$TZ" > /etc/timezone && \
    apt-get update && \
    apt-get install --no-install-recommends -y sudo build-essential libsqlite3-dev libboost-all-dev libssl-dev git python3-setuptools castxml ca-certificates && \    
    apt-get autoremove -y && \
    apt-get autoclean  -y
WORKDIR /ndnSIM/ns-3
ENTRYPOINT [ "/bin/bash" , "/entrypoint.sh" ]
