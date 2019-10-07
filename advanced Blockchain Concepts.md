# Advanced Blockchain Concepts
## Consensus Attacks
### What is Consensus?
- Blockchain are _decentralized_ networks that have share the same data

- Decentralized means is no single place where the "true" data is, every computer in the network has to keep its own copy of data

- For all the computers in the network to be able to share the same data, they all have to have the exact same copy of data on their machines

- They all have to agree to add the exact same records, in the exact same order to their datavases

- Because the computers don't know each other, this agreement has to be reached through a mechanical process called a <span style="color: #48dbfb">consensus protocol</span> (PoW, PoS, DPoS)

### Proof of Work
- Certain computers in the network are miners(anyone in the network can become a miner)

- A miner is someone who donates their computer power to the network

- Every node in the blockchain gets a transaction record when it submitted so that they can verify the transaction

- Valid transactions are sent to miner, who group transactions together into a block and turn that block into a hash

- Hashing turns the block into a <span style="color: #48dbfb">random number </span>

- Because the network is decentralized, lots of ,miners can be working on different transaction records and submiting them to the network, how should nodes know which miner's block accept?

- The network put an arbritary rule that says nodes should only accept blocks whose hashes are _**less**_ than a given number

- With hashes, if you change any characters in the data you're hashing, the entire hash number will change to another random number

- Miners take dvantage of this by adding _**nunce**_ to theire blocks and continually hashing untile the get a number that meets the difficulty target

- This process is <span style="color: #48dbfb">computationally intensive</span>, not mathically complicated, just take a lot of time/tries because the computer has to iterate through millions of nounces before one can product a blockhash that meets the difficulty target.

- The lower difficulty number is the more tries it takes to find a math

- In Bitcoin, the number us low enough that it takes all the computers in the network working together 19 minutes to find a match

- The difficulty target us adjusted base on how many computers are in the networks

### How does PoW Achieve Consensus
- Every time a miner creates a new block, they have to link it to the previous block in the chain by including pevious block's hash in their block, creates a chain of block/transactions in chronological order(i.e. theblockchain)

- As a miner, the moew powerful computer is, the more nonces you can iterate through, which means that you will produce blocks faster
    - The chain that has the most computing power behind it will produce blocks faster nad therfore be the longest chain
- Miners are rewarded every time theire block is added to the blockchain(i.e.the longest chain)
    - Miners are incentivized to add their computing power to the longest chain

### Consensus Attack
- Hypothetically, a block chain network is run by a lot of difference people who don't know each other, all acting in their own self interest(want to get Bitcoin reward)
    - No one in the network has more than a few % of the network hashing power

- If one entity had the majority of the computing power in the _**entire**_ network, they would be able to attack the _**security**_ and _**availability**_ of the network

- In practice, there are 2 scenarios that can gain the majority of the network's power
    - Advanced mining rigs
    - Contralized mining Pools

### Availability Attack : Denial of Service
- A denial of service attack is when a network doesn't let your transaction go through

- With  consensus attack, the miner with the majority of the hashing power could exclude all transactions from one or a few addresses from the blocks, so that those transactions would never be posted to the blockchain

- These attacks may not be profit, but launched by well-funded, state-backed attacked in an attemp to cripple the network

- Attacks are hypothetically possible, but become more and more infeasible as the hashrate if blockchain goes up

