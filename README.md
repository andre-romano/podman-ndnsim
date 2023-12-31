# Overview

Compiles ndnSIM (without python bindings) within Ubuntu and exposes a **/bin/bash** terminal for simulations. 

## Starting Container

### 1 - Using Docker CLI

To run NS3 simulations, just place the simulation scenario inside the **./ns-3/scratch** folder. Then, run the container as follows:
```bash
mkdir -p ./ns-3
docker run --rm -it -v ./ns-3:/ndnSIM/ns-3 docker.io/andreromano/ndnsim
```

### 2 - Using Docker Compose

Just issue the following command inside the folder that contains the **docker-compose.yaml** file:
```bash
docker compose up
```

## Running simulations

The container will provide a **/bin/bash** terminal that you can issue **./waf** commands as you normally would in Linux. You can also define any environment variables you like within the container's terminal.
```bash
NS_LOG=ndn.Consumer ./waf --run 'ndn-simple'
```

**NOTE:** The first time running ./waf the compilation will kickstart and it will take a while to complete.
