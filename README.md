# Overview

Compiles and runs ```ndnSIM``` within Ubuntu for discrete-event simulations. 

Github: https://github.com/andre-romano/podman-ndnsim

## Starting Container

To run NS3 simulations, just place your ns-3 path (git clone it) inside the ```./ndnSIM/ns-3``` folder. 

If you do not have an ```./ndnSIM/ns-3``` folder, just create an empty one. The container will populate it automatically.

Place your simulation scenarios inside path ```./ndnSIM/ns-3/scratch``` and run them with ```./waf``` command later. Each simulation scenario must have its own subpath inside the *scratch* folder.

There are two ways to start this container:

### Option 1 - Using Docker CLI (this method is faster to run the container)

Run the container as follows:
```bash
mkdir -p ./ndnSIM
docker run --rm -it -v ./ndnSIM:/ndnSIM docker.io/andreromano/ndnsim
```

### Option 2 - Using Docker Compose 

Run the container as follows:
```bash
docker compose up ; docker compose down
```

## Container execution modes 

### Non-interactive mode

To run the container in **non-interative mode**, provide a ```./ndnSIM/ns-3/entrypoint.sh``` file. The container will run the commands in this file and terminate. Example:
```bash
#!/bin/bash
NS_LOG=ndn.Consumer ./waf --run='ndn-simple'
```

### Interactive mode

If no ```./ndnSIM/ns-3/entrypoint.sh``` file is provided, the container is executed in **interactive mode**.

The container will provide a ```/bin/bash``` terminal that you can issue ```./waf``` commands as you normally would in Linux. You can also define or override any environment variables within the container's terminal. Check the example below:
```bash
NS_LOG=ndn.Consumer ./waf --run 'ndn-simple'
```

**NOTE:** The first time running ```./waf``` the compilation will kickstart and it will take a while to complete. This will happen in either one of the interactive or non-interactive container modes.
