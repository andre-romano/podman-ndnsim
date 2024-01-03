#!/bin/bash
PYBINDGEN_PATH=/ndnSIM/pybindgen
NS3_PATH=/ndnSIM/ns-3

PYBINDGEN_BRANCH=0.22.1
NS3_BRANCH=ndnSIM-ns-3.35
NDNSIM_BRANCH=ndnSIM-2.9-NFD-22.02

mkdir -p $NS3_PATH $PYBINDGEN_PATH
if [ -z "$( ls $PYBINDGEN_PATH )" ]; then  
    git config --global http.version HTTP/1.1 && 
    git clone -b "$PYBINDGEN_BRANCH" https://github.com/named-data-ndnSIM/pybindgen.git "$PYBINDGEN_PATH"
fi
if [ -z "$( ls $NS3_PATH )" ]; then    
    git config --global http.version HTTP/1.1 && 
    git clone -b "$NS3_BRANCH"                https://github.com/named-data-ndnSIM/ns-3-dev.git  "$NS3_PATH" && 
    git clone -b "$NDNSIM_BRANCH" --recursive https://github.com/named-data-ndnSIM/ndnSIM.git    "$NS3_PATH/src/ndnSIM" &&     
    cd "$NS3_PATH" &&
    ./waf configure -d debug --enable-examples
fi
cd "$NS3_PATH" 
if [ -e "./entrypoint.sh" ]; then    
    /bin/bash "./entrypoint.sh"
else
    /bin/bash
fi
