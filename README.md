# ethereum

Ethereum (geth and prysm) on Docker

## Pre-Requisites

Check if docker is installed:

```bash
make check_docker
```

Create the shared secret:

```bash
openssl rand -hex 32 | tr -d "\n" > "jwt.hex"
```

## Start the Containers

Start the ethereum execution client (geth) and the consensus client (prysm):

```bash
docker-compose up -d --build # or: make up
```

## Monitor the Initial Block Download

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

To view the timestamp of the returned block number:

```bash
curl -s -H "Content-type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"eth_getBlockByNumber","params":["0x25d0bf", false],"id":1}' localhost:8545 | jq -r '.result.timestamp' | tr -d '\n' |  xargs -0 printf "%d"
```

We can view how many seconds is our node out of sync, by subtracting the current date in epoch with the timestamp of the node's current block:

```bash
echo $$(($(date +%s) - 1671031284))
```


