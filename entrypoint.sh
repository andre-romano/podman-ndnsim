#!/bin/bash

cd /ndnSIM
if [ -z "$( ls ./pybindgen )" ]; then  
    git config --global http.version HTTP/1.1 && \
    git clone -b 0.21.0 https://github.com/named-data-ndnSIM/pybindgen.git pybindgen 
fi
cd /ndnSIM
if [ -z "$( ls ./ns-3 )" ]; then    
    git config --global http.version HTTP/1.1 && \
    git clone -b ndnSIM-ns-3.30.1             https://github.com/named-data-ndnSIM/ns-3-dev.git  ns-3 && 
    git clone -b ndnSIM-2.8       --recursive https://github.com/named-data-ndnSIM/ndnSIM.git    ns-3/src/ndnSIM &&     
    cd ./ns-3 &&
    ./waf configure -d debug --enable-examples
fi
cd /ndnSIM/ns-3
if [ -e "./entrypoint.sh" ]; then    
    /bin/bash "./entrypoint.sh"
else
    /bin/bash
fi
