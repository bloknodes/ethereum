# ethereum

[![Build Docker Images](https://github.com/bloknodes/ethereum/actions/workflows/build-and-push-images.yml/badge.svg)](https://github.com/bloknodes/ethereum/actions/workflows/build-and-push-images.yml)

Ethereum (geth and prysm) on Docker

## Pre-Requisites

Check if docker is installed:

```bash
make check_docker
```

Create the shared secret:

```bash
openssl rand -hex 32 | tr -d "\n" > "jwt.hex"    # or: make jwt.hex
```

## Start the Containers

Start the ethereum execution client (geth) and the consensus client (prysm):

```bash
docker-compose up -d --build # or: make up
```

## Monitor the Initial Block Download


### Geth

View the current sync status:

```bash
curl -s -X POST -H 'Content-Type: application/json'  --data '{"jsonrpc":"2.0","method":"eth_syncing","params":[],"id":51}' http://127.0.0.1:8545
```

To view the current block:

```bash
curl -s -X POST -H 'Content-Type: application/json'  --data '{"jsonrpc":"2.0","method":"eth_syncing","params":[],"id":51}' http://127.0.0.1:8545 | jq -r '.result.currentBlock' | tr -d '\n' |  xargs -0 printf "%d"
```

View the node's latest synced block:

```bash
curl -s -X POST -H 'Content-Type: application/json'  --data '{"jsonrpc":"2.0","method":"eth_syncing","params":[],"id":51}' http://127.0.0.1:8545 | jq -r '.result.currentBlock'
```

To view the timestamp of the returned block number (or use `["latest", false]` ):

```bash
curl -s -H "Content-type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"eth_getBlockByNumber","params":["0x25d0bf", false],"id":1}' localhost:8545 | jq -r '.result.timestamp' | tr -d '\n' |  xargs -0 printf "%d"
```

We can view how many seconds is our node out of sync, by subtracting the current date in epoch with the timestamp of the node's current block:

```bash
current_ts=$(date +%s)
block_ts=$(curl -s -H "Content-type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"eth_getBlockByNumber","params":["0x25d0bf", false],"id":1}' localhost:8545 | jq -r '.result.timestamp' | tr -d '\n' |  xargs -0 printf "%d")

echo $((current_ts - block_ts))
```

### Prysm

```bash
curl -s http://localhost:3500/eth/v1/node/syncing | jq -r '.'
```

## Post Initial Sync

When the sync has been completed, consider removing `"--snapshot=false"` from `geth/Dockerfile`.

## Monitoring

Monitoring with Grafana and Prometheus is available in the `_extras` directory:

```bash
cd _extras
docker-compose -f docker-compose-monitoring.yaml up -d
# docker compose -f docker-compose-monitoring.yaml up -d
cd ..
```

Grafana will be exposed on port 3000 and prometheus on port 9090

## Tear Down

Stop the containers:

```bash
make down
```
