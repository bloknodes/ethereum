# notes

## Difference between snap and full sync mode

In Ethereum nodes like Geth, the terms "snap sync" and "full sync" refer to different synchronization methods. These methods are used when a node is joining the Ethereum network and needs to download and process the entire blockchain. Here's an overview of the differences:

1. **Full Sync:**
   - In a full sync, the node downloads the entire blockchain from the beginning (genesis block) and verifies each block by processing all transactions and executing all smart contract code.
   - This method ensures that the node has a complete and fully verified copy of the Ethereum blockchain, but it can take a considerable amount of time and resources, especially as the Ethereum blockchain grows over time.
   - Full sync is the traditional synchronization method and is reliable but can be resource-intensive.

2. **Snap Sync:**
   - Snap sync is a more optimized synchronization method introduced to reduce the time and resources required for synchronization.
   - Instead of processing and executing all transactions from the genesis block, snap sync downloads a recent "snapshot" of the Ethereum state and then applies the remaining transactions from that point onward.
   - Snap sync significantly accelerates the synchronization process because it doesn't need to replay every transaction from the beginning. It is particularly useful for quickly joining the network without waiting for a full sync.
   - Snap sync can be more resource-efficient compared to full sync, making it a preferred choice for nodes with limited resources.

In summary, the main difference between snap sync and full sync lies in the approach to synchronization. Full sync processes and verifies every transaction from the beginning, while snap sync leverages a recent snapshot of the state to speed up the process. The choice between the two depends on factors such as the available resources, synchronization speed requirements, and the desire for a fully verified history of the blockchain.

