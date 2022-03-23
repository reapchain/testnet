#!/bin/bash

REAPCHAIND="./reapchaind"

RUN_TYPE=$1
DATA_DIR=$2

CURRENT_DATA_DIR="$DATA_DIR/data"
CURRENT_LOG_DIR="$DATA_DIR/log"

if [ $RUN_TYPE = "f" ]; then
  echo "$REAPCHAIND start --home $CURRENT_DATA_DIR"
  $REAPCHAIND start --home $CURRENT_DATA_DIR

else
  echo "$REAPCHAIND start --home $CURRENT_DATA_DIR &> $CURRENT_LOG_DIR/log.log &"
  $REAPCHAIND start --home $CURRENT_DATA_DIR &> $CURRENT_LOG_DIR/log.log &
fi
