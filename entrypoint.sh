#!/bin/bash
MOUNTPOINT=/ndnSIM
NS3_PATH=$MOUNTPOINT/ns-3
NS3_ENTRYPOINT=$NS3_PATH/entrypoint.sh

if [ -z "$( ls $NS3_PATH )" ]; then    
    cd $MOUNTPOINT &&
    git config --global http.version HTTP/1.1 && 
    git clone https://github.com/named-data-ndnSIM/ns-3-dev.git ns-3 && 
    git clone https://github.com/named-data-ndnSIM/pybindgen.git pybindgen && 
    git clone --recursive https://github.com/named-data-ndnSIM/ndnSIM.git ns-3/src/ndnSIM &&     
    cd ns-3 &&
    ./waf configure -d debug --enable-examples
fi
cd $NS3_PATH
if [ -e "$NS3_ENTRYPOINT" ]; then    
    /bin/bash "$NS3_ENTRYPOINT"
else
    /bin/bash
fi
