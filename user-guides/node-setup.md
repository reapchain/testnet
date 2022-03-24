# Join Testnet

### Joining a Testnet

You specify the network you want to join by setting the **genesis file** and **seeds**. If you need more information about past networks, check our [testnets repo](https://github.com/reapchain/testnets)

| Testnet Chain ID | Description                    | Site                                                                               | Version | Status |
| ---------------- | ------------------------------ | ---------------------------------------------------------------------------------- | ------- | ------ |
| mercury\_2022-1  | Reapchain Testnet(with EVM)    | [mercury\_2022-1](https://github.com/reapchain/testnets/tree/main/mercury\_2022-1) | v0.2.x  | Live   |
| mercury          | Reapchain Testnet(without EVM) | [mercury](https://github.com/reapchain/testnets/tree/main/mercury)                 | v0.1.x  | Steal  |



If you would like to setup a general node on your local machine to participate and store data for the Blockchain, the you can do so by following these step:

1. Download the genesis.json file from [here](https://raw.githubusercontent.com/reapchain/testnets/main/mercury\_2022-1/genesis.json)
2. Download the node\_init.sh file from [here](https://raw.githubusercontent.com/reapchain/testnets/main/mercury\_2022-1/node\_init.sh)
3. Download the node\_init.sh file from [here](https://raw.githubusercontent.com/reapchain/testnets/main/mercury\_2022-1/node\_run.sh)
4. Download the reapchain\_Linux\_x86\_64.tar.gz file from [here](../mercury\_2022-1/reapchain\_Linux\_x86\_64.tar.gz) then ㅕ
5. If you follow all the above steps, you can get all the files needed for verification on the LipChain Testnet.
6. Replace "---DOWNLOADED-MERCURY-BINARY-FILE-PATH---" with the path of the downloaded mercury binary file from [here](user-guides/initial-setup.md#binary-file)
7. Replace "---DOWNLOADED-GENESIS-FILE---" with the path of the downloaded Genesis File
8. Execute this bash script

```
#!/bin/bash

DATA_PATH="./mercury-data/normal-node"
NODE_NAME="my-node"
HOST=$(hostname -I | cut -f 1 -d ' ')


CHAIN_ID=mercury_2022-1
MERCURY_DAEMON= ---DOWNLOADED-MERCURY-BINARY-FILE-PATH--- # absolute path


rm -rf $DATA_PATH
$MERCURY_DAEMON init $NODE_NAME --chain-id $CHAIN_ID --home $DATA_PATH
cp ---DOWNLOADED-GENESIS-FILE---  $DATA_PATH/config/genesis.json


sed -i 's/enable = false/enable = true/g' $DATA_PATH/config/app.toml

sed -i 's/address = \"0.0.0.0:9090\"/address = \"'$HOST':9090\"/g' $DATA_PATH/config/app.toml

sed -i 's/stake/ureap/g' $DATA_PATH/config/genesis.json

sed -i 's/minimum-gas-prices = \"\"/minimum-gas-prices = \"0.1areap\"/g' $DATA_PATH/config/app.toml

sed -i 's/enabled-unsafe-cors = false/enabled-unsafe-cors = true/g' $DATA_PATH/config/app.toml

sed -i 's/cors_allowed_origins = [[]]/cors_allowed_origins = ["*"]/g' $DATA_PATH/config/config.toml

sed -i 's/allow_duplicate_ip = false/allow_duplicate_ip = true/g' $DATA_PATH/config/config.toml

sed -i "s/laddr = \"tcp:\/\/127.0.0.1:26657\"/laddr = \"tcp:\/\/$HOST:27100\"/g" $DATA_PATH/config/config.toml

sed -i "s/laddr = \"tcp:\/\/0.0.0.0:26656\"/laddr = \"tcp:\/\/$HOST:27000\"/g" $DATA_PATH/config/config.toml

sed -i "s/persistent_peers = .*/persistent_peers = \"9C13F7EADFBA2E42FF3FF58275A01097283B3527@13.124.60.235:27100\"/g" $DATA_PATH/config/config.toml


$MERCURY_DAEMON start --home $DATA_PATH

```
