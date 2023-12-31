#!/bin/bash
MOUNTPOINT=/ndnSIM
if [ -z "$(ls $MOUNTPOINT/ns-3)" ]; then    
    cd $MOUNTPOINT &&
    git config --global http.version HTTP/1.1 && 
    git clone https://github.com/named-data-ndnSIM/ns-3-dev.git ns-3 && 
    git clone https://github.com/named-data-ndnSIM/pybindgen.git pybindgen && 
    git clone --recursive https://github.com/named-data-ndnSIM/ndnSIM.git ns-3/src/ndnSIM &&     
    cd ns-3 &&
    ./waf configure -d debug --disable-python --enable-examples
fi
cd $MOUNTPOINT/ns-3
/bin/bash