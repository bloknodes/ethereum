# Use the official Prysm image
FROM gcr.io/prysmaticlabs/prysm/beacon-chain:v4.1.1

# Set your ethereum address (default: sepolia-faucet)
ENV ETHEREUM_ADDRESS=0x6Cc9397c3B38739daCbfaA68EaD5F5D77Ba5F455

# Set up the work directory
WORKDIR /data

# Expose necessary ports (4000 for P2P)
EXPOSE 4000

# Run Prysm beacon node
CMD ["--sepolia", \
     "--datadir=/data", \
     "--execution-endpoint=http://geth:8551", \
     "--jwt-secret=/shared/jwt.hex", \
     "--rpc-host=0.0.0.0", \
     "--checkpoint-sync-url=https://sepolia.beaconstate.info", \
     "--genesis-beacon-api-url=https://sepolia.beaconstate.info", \
     "--suggested-fee-recipient=0x6Cc9397c3B38739daCbfaA68EaD5F5D77Ba5F455", \
     "--accept-terms-of-use" ]

