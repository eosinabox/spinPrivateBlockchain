#!/bin/bash
DATADIR="./blockchain"

if [ ! -d $DATADIR ]; then
  mkdir -p $DATADIR;
fi

nodeos \
--signature-provider EOS5QyCi5f1vsnbnZEiJBp2c9P6HZp9tS86FrjEWP2amTqK7A4FMH=KEY:5JFggr1J7ZR2hC73R94rbYbHE45VjDGe32zHneV6DEKDEQejSw4 \
--plugin eosio::producer_plugin \
--plugin eosio::chain_api_plugin \
--plugin eosio::http_plugin \
--plugin eosio::history_api_plugin \
--plugin eosio::history_plugin \
--data-dir $DATADIR"/data" \
--blocks-dir $DATADIR"/blocks" \
--config-dir $DATADIR"/config" \
--producer-name parisbp \
--http-server-address 0.0.0.0:8899 \
--p2p-listen-endpoint 0.0.0.0:4444 \
--access-control-allow-origin=* \
--contracts-console \
--http-validate-host=false \
--verbose-http-errors \
--enable-stale-production \
--p2p-peer-address 23.22.252.8:4444 \
--p2p-peer-address 54.213.191.232:4444 \
--p2p-peer-address 13.125.221.154:4444 \
>> $DATADIR"/nodeos.log" 2>&1 & \
echo $! > $DATADIR"/eosd.pid"

