# Node Setup

If you would like to setup a general node on your local machine to participate and store data for the Blockchain, the you can do so by following these step:

1. Download the Genesis.json file from [here](https://raw.githubusercontent.com/reapchain/testnets/e9f5839fb7d26f036dd5099e49c9b63d0a208b53/genesis.json).
2. Replace "---DOWNLOADED-MERCURY-BINARY-FILE-PATH---" with the path of the downloaded mercury binary file from [here](user-guides/initial-setup.md#binary-file)
3. Replace "---DOWNLOADED-GENESIS-FILE---" with the path of the downloaded Genesis File
4. Execute this bash script

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

sed -i "s/persistent_peers = .*/persistent_peers = \"e3bf37d09952b826d77c4a00a317ebf9af8eb4f9@13.124.60.235:27100\"/g" $DATA_PATH/config/config.toml


$MERCURY_DAEMON start --home $DATA_PATH

```
