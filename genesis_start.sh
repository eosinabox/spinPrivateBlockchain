#!/bin/bash
DATADIR="./blockchain"

if [ ! -d $DATADIR ]; then
  mkdir -p $DATADIR;
fi

nodeos \
	--genesis-json $DATADIR"/../genesis.json" \
--signature-provider EOS68DyF48cj4yv5V96car8oRXMyvExopX3q52oDA5UBvxJy6469P=KEY:5KKvCAsekQY62rpPpJPGeSfkLdQLu1EydnKA8upQqinGSuoFLrh \
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
--p2p-peer-address 127.0.0.1:4445 \
--p2p-peer-address 23.22.252.8:4444 \
--p2p-peer-address 54.213.191.232:4444 \
--p2p-peer-address 13.125.221.154:4444 \
>> $DATADIR"/nodeos.log" 2>&1 & \
echo $! > $DATADIR"/eosd.pid"

