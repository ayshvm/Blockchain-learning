#!/usr/bin/env bash

CHAINID="mocha-4"

# reset node
celestia-appd tendermint unsafe-reset-all --home $HOME/.celestia-app --keep-addr-book

# initialize node
celestia-appd init test --chain-id $CHAINID  --home $HOME/.celestia-app

# get genesis
wget -O genesis.json https://snapshots.polkachu.com/testnet-genesis/celestia/genesis.json --inet4-only
cp genesis.json $HOME/.celestia-app/config/genesis.json

# get seeds and peers
PEERS=81edc4681b0d35c3adf94f397ac134befe5fdf4f@159.69.193.68:25656,6a09e06bba9a34afd48471466a0ac39a4173bbab@5.2.128.186:26656,daf2cecee2bd7f1b3bf94839f993f807c6b15fbf@65.109.92.79:11656,dadb05368c08b1ea13e67ab1e552b53fbdff56ed@65.109.85.225:6050,de181ebe22ce14483abbb8695bdb43c1169246af@185.144.99.223:26656
sed -i.bak -e "s/^persistent_peers *=.*/persistent_peers = \"$PEERS\"/" $HOME/.celestia-app/config/config.toml

SEEDS=ade4d8bc8cbe014af6ebdf3cb7b1e9ad36f412c0@testnet-seeds.polkachu.com:11656
sed -i.bak -e "s/^seeds *=.*/seeds = \"$SEEDS\"/" $HOME/.celestia-app/config/config.toml

sed -i'.bak' 's#"tcp://127.0.0.1:26657"#"tcp://0.0.0.0:26657"#g' $HOME/.celestia-app/config/config.toml

# get latest snapshot, will be made dynamic argument for latest snapshot 
curl -o - -L https://snapshots.polkachu.com/testnet-snapshots/celestia/celestia_1627192.tar.lz4 | lz4 -c -d - | tar -x -C $HOME/.celestia-app


# Start the celestia-app
celestia-appd start --home $HOME/.celestia-app 
