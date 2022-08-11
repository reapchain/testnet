#!/bin/bash
OSTYPE="`uname | tr '[:upper:]' '[:lower:]'`"
if [[ "$OSTYPE" = "darwin"* ]]; then
    HOST=$(ifconfig en0 | grep 192 | cut -f 2 -d ' ')
elif [[ "$OSTYPE" = "linux"* ]]; then
    HOST=$(hostname -I | cut -f 1 -d ' ')
fi

REAPCHAIND="./reapchaind"

# HOST=$(hostname -I | cut -f 1 -d ' ')

CHAIN_ID="mercury_2022-3"

echo -n "Please input seed node host (default seed node host: 3.39.65.126): "
read -r SEED_HOST

echo -n "Please input seed node id (default seed node id: d2be19561b2c01fb5c23f1b0867b71bf1f057924): "
read -r SEED_NODE_ID

echo -n "Please input seed node reapchain port (default: 27100): "
read -r SEED_REAPCHAIN_PORT

echo -n "Please input data directory (default: data): "
read -r DATA_DIR

echo -n "Please input your rpc port (default: 27000): "
read -r RPC_PORT

echo -n "Please input your reapchain port (default: 27100): "
read -r REAPCHAIN_PORT

echo -n "Please input app rpc port (default: 9090): "
read -r APP_RPC_PORT

echo -n "Please input moniker (default: reapchaind): "
read -r MONIKER

# GRPC_PORT
# WEB_GRPC_PORT
# EVM_RPC_PORT
# EVM_WS_PORT

if [ $SEED_HOST == ""]; then
    SEED_HOST="13.125.20.241"
fi

if [ $SEED_NODE_ID == ""]; then
    SEED_NODE_ID="36b161a2699a994d8410c89868650ff685d8f7af"
fi

if [ $SEED_REAPCHAIN_PORT == ""]; then
    SEED_REAPCHAIN_PORT=27100
fi

if [ $DATA_DIR == ""]; then
    DATA_DIR=data
fi

if [ $RPC_PORT == ""]; then
    RPC_PORT=27000
fi

if [ $REAPCHAIN_PORT == ""]; then
    REAPCHAIN_PORT=27100
fi

if [ $APP_RPC_PORT == ""]; then
    APP_RPC_PORT=9090
fi

if [ $MONIKER == ""]; then
    MONIKER="reapchaind"
fi


CURRENT_DATA_DIR="$DATA_DIR/data"
CURRENT_LOG_DIR="$DATA_DIR/log"

rm -rf $CURRENT_DATA_DIR
rm -rf $CURRENT_LOG_DIR
mkdir -p $CURRENT_LOG_DIR

$REAPCHAIND init $MONIKER --home $CURRENT_DATA_DIR --chain-id $CHAIN_ID

echo "RPC_PORT: $RPC_PORT"
echo "REAPCHAIN_PORT: $REAPCHAIN_PORT"

echo "cp ./genesis.json $CURRENT_DATA_DIR/config/genesis.json"
cp ./genesis.json $CURRENT_DATA_DIR/config/genesis.json

# EnableUnsafeCORS defines if CORS should be enabled (unsafe - use it at your own risk).
sed -i.temp 's/enabled-unsafe-cors = false/enabled-unsafe-cors = true/g' $CURRENT_DATA_DIR/config/app.toml

sed -i.temp 's/cors_allowed_origins = \[\]/cors_allowed_origins = \["\*"\]/g' $CURRENT_DATA_DIR/config/config.toml
sed -i.temp 's/cors_allowed_headers = \["Origin", "Accept", "Content-Type", "X-Requested-With", "X-Server-Time", \]/cors_allowed_headers = \["Origin", "Accept", "Content-Type", "X-Requested-With", "X-Server-Time", "Access-Control-Request-Method", "Access-Control-Request-Headers", "Authorization", \]/g' $CURRENT_DATA_DIR/config/config.toml

# set REAPCHAIN adress
sed -i.temp "s/laddr = \"tcp:\/\/0.0.0.0:26656\"/laddr = \"tcp:\/\/${HOST}:${REAPCHAIN_PORT}\"/g" $CURRENT_DATA_DIR/config/config.toml 

# set RCP address
sed -i.temp "s/laddr = \"tcp:\/\/127.0.0.1:26657\"/laddr = \"tcp:\/\/${HOST}:${RPC_PORT}\"/g" $CURRENT_DATA_DIR/config/config.toml

# Moniker
sed -i.temp "s/moniker = \"$MONIKER\"/moniker = \"node$INDEX\"/g" $CURRENT_DATA_DIR/config/config.toml


sed -i.temp 's/allow_duplicate_ip = false/allow_duplicate_ip = true/g' $CURRENT_DATA_DIR/config/config.toml

sed -i.temp 's/recv_rate = 5120000/recv_rate = 20480000/g' $CURRENT_DATA_DIR/config/config.toml
sed -i.temp 's/send_rate = 5120000/send_rate = 20480000/g' $CURRENT_DATA_DIR/config/config.toml

sed -i.temp 's/grpc_max_open_connections = 900/grpc_max_open_connections = 900/g' $CURRENT_DATA_DIR/config/config.toml

# [p2p: max_packet_msg_payload_size]
sed -i.temp 's/max_packet_msg_payload_size = 1024/max_packet_msg_payload_size = 10240/g' $CURRENT_DATA_DIR/config/config.toml

# Only enable API Server, the rest disable
sed -i.temp 's/enable = false/enable = true/g' $CURRENT_DATA_DIR/config/app.toml

# [Rosetta disable]
sed -i.temp '138s/enable = true/enable = false/' $CURRENT_DATA_DIR/config/app.toml

# Mempool Size
# sed -i.temp 's/size = 5000/size = 20000/g' $CURRENT_DATA_DIR/config/config.toml

sed -i.temp 's/minimum-gas-prices = \"0aphoton\"/minimum-gas-prices = \"1.47areap\"/g' $CURRENT_DATA_DIR/config/app.toml

# Setting seed node
sed -i.temp "s/seeds = .*/seeds = \"$SEED_NODE_ID@$SEED_HOST:$SEED_REAPCHAIN_PORT\"/g" $CURRENT_DATA_DIR/config/config.toml



rm -rf $CURRENT_DATA_DIR/config/config.toml.temp
rm -rf $CURRENT_DATA_DIR/config/app.toml.temp