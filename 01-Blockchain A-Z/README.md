
## Blockchain A-Z

### Understanding HSA256-Hash
the 5 requirement of SHA256
- One-way
- Deterministic
- Fast Computation
- Avalanche effect
- Must withstand collisions

Wouter Penard & Tim van Werkhoven, (2008)[ On the Secure Hash Algorithm family (Chapter 1 of Cryptography in Context)](https://www.staff.science.uu.nl/~tel00101/liter/Books/CrypCont.pdf)

---

###  Immutable Ledger
An Immutable Ledger simply means a record that cannot be changed.
The idea behind all of this is data security and proof that the data has not been altered.

The Blockchain Economy: [A beginner’s guide to institutional cryptoeconomics](https://medium.com/cryptoeconomics-australia/the-blockchain-economy-a-beginners-guide-to-institutional-cryptoeconomics-64bf2f2beec4)


---

### Distributed P2P network
This is the physical architecture that allows Blockchain to work and provides a blockchain with redundancy.
In a peer to peer, the nodes (laptops, tablets, etc) all talk directly to each other.
Instead of a server holding all the information, the data that makes up the blockchain is instead distributed across all the different nodes.
So the more nodes that are part of the blockchain, the more copies of it that exist.

Vitalik Buterin, (2017), [The Meaning of Decentralization](https://medium.com/@VitalikButerin/the-meaning-of-decentralization-a0c92b76a274)


### Byzantine Fault Tolerance
Byzantine Fault Tolerance is the characteristic which defines a system that tolerates the class of failures that belong to the Byzantine Generals’ Problem.
Byzantine Failure is the most difficult class of failure modes.
It implies no restrictions, and makes no assumptions about the kind of behavior a node can have (e.g. a node can generate any kind of arbitrary data while posing as an honest actor).
Byzantine Faults are the most severe and difficult to deal with.
Byzantine Fault Tolerance has been needed in airplane engine systems, nuclear power plants and pretty much any system whose actions depend on the results of a large amount of sensors.
Even SpaceX was considering it as a potential requirement for their systems.

Leslie Lamport, Robert Shostak, & Marshall Pease, (1982).[The Byzantine Generals Problem](https://people.eecs.berkeley.edu/~luca/cs174/byzantine.pdf)
Georgios Konstantopoulos, (2017).[Understanding Blockchain Fundamentals, Part 1: Byzantine Fault Tolerance](https://medium.com/loom-network/understanding-blockchain-fundamentals-part-1-byzantine-fault-tolerance-245f46fe8419)

---

### Consensus Protocol
Consensus protocols are one of the most important and revolutionary aspects of blockchain technology.
These protocols create an irrefutable system of agreement between various devices across a distributed network,
whilst preventing exploitation of the system. Here we will explore how these systems work and how various protocols differ from one another.

Satoshi Nakamoto, (2008). Re: [Bitcoin P2P e-cash paper](https://www.mail-archive.com/cryptography@metzdowd.com/msg09997.html)
Amy Castor, (2017). [A (Short) Guide to Blockchain Consensus Protocols](http://www.coindesk.com/short-guide-blockchain-consensus-protocols)

---

## Cryptocurrency

### What is Bitcoin
    Layers
    1-Technology
        Blockchain

    2- Protocol/coin
        cryptocurrency
            Bitcoin
            Ethereum
            Waves
            Neo
            Ripple
            etc.

    3-Token (idea behinde what they building)
        ICO -- smart contract
            Waves
            Ethereum
            Neo
        Power Ledger

    create the system
    The Bitcoin ecosystem
    - Nodes
    - Miners
    - Large Mines
    - Mining pools

Satoshi Nakamoto, (2008). [Bitcoin: A Peer-to-Peer Electronic Cash System](https://bitcoin.org/bitcoin.pdf)

---

### Bitcoin's Monetary Policy
The Halving
- control quantity of coint amount
- Every 4 years, Block reduce by 21000

Block frequency
Mark E. Jeftovic, (2017). [The Time is Different Part 2: What Bitcoin Really Is](https://hackernoon.com/this-time-is-different-part-2-what-bitcoin-really-is-ae58c69b3bf0)

---

### Mining Dificulty
    What is the current target and how does that feel

        current target 18 leading zeroos
        Propbability
        total posible 64 digit = 16^64

        difficulty = current tr=arget/ max target

        Whrere the current target stored?
        Bits -> Hex -> Derive target
            field Bits :402759343(hex)

        Assuming that the current mining difficulty requires 18 leading zeros for a hash to be vaild, what is the probability that a hash selected at random will be valid?
        0.0000000000000000002%

---

### Mining Pools
a mining pool is the pooling of resources by miners, who share their processing power over a network, to split the reward equally,
according to the amount of work they contributed to the probability of finding a block

[Hashrate Distribution](https://www.blockchain.com/en/pools)

---

### Nounce Range
#### Nounce
The "nonce" in a bitcoin block is a 32-bit (4-byte) field whose value is adjusted by miners so that the hash of the block will be less than or equal to the current target of the network.
The rest of the fields may not be changed, as they have a defined meaning.
The target required is also represented as the difficulty, where a higher difficulty represents a lower target.
As this iterative calculation requires time and resources, the presentation of the block with the correct nonce value constitutes proof of work.

#### Golden Nonce
A golden nonce in Bitcoin mining is a nonce which results in a hash value lower than the target.

* range 0-4 Billion
* valid in a second

 ---

###  How Miners Pick Transactions
pick from meomory pool
- select transction that maximize fees
- if overcome nounce anh hash not valid
- change block config(reduce fee)

transaction will release(very less fees) if no minors pickup(72Hr)
Noelle Acheson, (2018). [How Bitcoin Mining Works](https://www.coindesk.com/information/how-bitcoin-mining-works/)

---

### CPU's vs GPU's vs ASIC's
- CPU Gerneral < 10MH/s
- GPU Specialize, matrix operation    < 1GH/s
- ASIC Totally Specialized > 1000GH/s
Vijay Pradeep, (2017). [Ethereum's Memory Hardness Explained, and the Road to Mining it with Custom Hardware](https://www.vijaypradeep.com/blog/2017-04-28-ethereums-memory-hardness-explained/)


---

###  Mempools Work
- The storage area where transactions are stored before they are added to a block.
- Every participant of P2P distributed network has their mempool on their computer.
Marion Deneuville, (2016), [An in-depth guide into how the mempool works](https://blog.kaiko.com/an-in-depth-guide-into-how-the-mempool-works-c758b781c608)


---

###  Orphaned blocks
- Detached or Orphaned blocks are valid blocks which are not part of the main chain.
- They can occur naturally when two miners produce blocks at similar times or they can be caused by an attacker (with enough hashing power) attempting to reverse transactions.
- At least 6 wait transaction for confirm

[orphaned-blocks](https://www.blockchain.com/btc/orphaned-blocks)

---

### The 51% Attack
- 51% of hash rate
- when a group od hidden participants with majority computational power conduct mining without announcing their version of chain to the rest of the network.
- The attackers can benefit by leveraging the double spend problem.

---

### Transactions and UTXOs
 UTXOs : Unspent Transaction Output

    example :
     my transction:
     Mark   -> Me 0.1 BTC
     Helen  -> Me 0.3 BTC
     Sysan  -> Me 0.6 BTC
     Mike   -> Me 0.7 BTC
        those call utxo

    I want to buy a bicycle for 0.5 BTC
    TRANSACTION:
    Input                   Output
    0.6 BTC from Helen  >>  0.5 BTC to the bike shop >> new UTXOs
                            0.1 back to myself  .>> new UTXOs
    my transction:
    Mark   -> Me 0.1 BTC
    Helen  -> Me 0.3 BTC
    Mike   -> Me 0.7 BTC
    Me     -> Me 0.1 BTC

    I want to by 2nd bicycle for 1.1 BTC
    TRANSACTION:
    Input                   Output
    0.3 BTC from Helen  >>  1.1 BTC to the bike shop >> new UTXOs
    0.7 BTC from Mike
    0.1 BTC from Me

    my transction:
    Mark   -> Me 0.1 BTC ---> UTXOs

---

### Where do tanscaction fees come from?

    my UTXOs:
    Mark   -> Me 0.1 BTC
    Helen  -> Me 0.1 BTC
    Mike   -> Me 0.4 BTC
    Sarah  -> Me 0.3 BTC
    Helen  -> Me 0.3 BTC

    I want to buy 3rd bicycle for 0.9 BTC and apple for 0.02 BTC
    TRANSACTION:
    Input                   Output
    0.4 BTC from Mike  >>   0.9 BTC to the bike shop >> new UTXOs
    0.3 BTC from Sarah      0.02 BTC to fruit shop
    0.3 BTC from Helen      0.06 BTC to Me
                            fees: 0.02 BTC

    my UTXOs:
    Mark   -> Me 0.1 BTC
    Helen  -> Me 0.1 BTC
    Me     -> Me 0.06 BTC

---

### Signatures Private & Public Keys

             ------------------     generate      ------------------
         ---|    Private key   |---------------> |    Public key    |
        |    ------------------                   ------------------
        |
        |
        |     ------------------
        v    |                  |                 ------------------
        +<---|     Message      |--------------->|                  |
        |    |                  |                |                  |
        |     ------------------                 |  Verification    |-----> Yes/No
        |     ------------------                 |    Function      |
        ---> |    Signatures    |--------------->|                  |
              ------------------                  ------------------



### What is Segregated Witness (SegWit)
The idea for SegWit was first introduced by Pieter Wuille at a Bitcoin conference in 2015.
Segregated Witness is a process by which the block size limit is increased by segregating the digital signature from the original data.
Segregated means separation, witness means digital signature.

Wuille suggested SegWit as a solution to a flaw in the Bitcoin protocol.
In software development, solutions to flaws are called patches.
The problem he wanted to fix is called transaction malleability.
Transaction malleability is a nerdy way of saying that Bitcoin can be stolen from users by changing tiny pieces of transaction information.

Jimmy Song, (2017), [Understanding Segwit Block Size](https://medium.com/@jimmysong/understanding-segwit-block-size-fd901b87c9d4)

---

### Public Key vs Bitcoin Address
    Bitcoin addrss:
        - derive from public key

        Mike:
                                                                            |
             ------------------     generate      ------------------        |          ------------------
         ---|    Private key   |---------------> |    Public key    |-------|-------> |   Mike address   |
        |    ------------------                   ------------------        |          ------------------
        |                                                                   |
        |                                                                   |
        |     ------------------                                            |
        v    |                  |                 ------------------        |
        +<---|     Message      |--------------->|                  |       |
        |    |                  |                |                  |       |
        |     ------------------                 |  Verification    |       |
        |     ------------------                 |    Function      |       |
        ---> |    Signatures    |--------------->|                  |       |
              ------------------                  ------------------        |
                                                          |                 |
                                                          v                 |
                                                         Yes/No


        Sarah
                                                                            |
             ------------------     generate      ------------------        |          ------------------
         ---|    Private key   |---------------> |    Public key    |-------|-------> |  Sarah address   |
        |    ------------------                   ------------------        |          ------------------
        |                                                                   |
        |                                                                   |
        |     ------------------                                            |
        v    |                  |                 ------------------        |
        +<---|     Message      |--------------->|                  |       |
        |    |                  |                |                  |       |
        |     ------------------                 |  Verification    |       |
        |     ------------------                 |    Function      |       |
        ---> |    Signatures    |--------------->|                  |       |
              ------------------                  ------------------        |
                                                          |                 |
                                                          v                 |
                                                         Yes/No


        Mike  -> Sarah : 06 BTC

                                                                            |
             ------------------     generate      ------------------        |          ------------------
         ---|    Private key   |---------------> |    Public key    |-------|-------> |  Mike address   |
        |    ------------------                   ------------------        |          ------------------
        |                                                                   |
        |                                                                   |
        |     ------------------                                            |
        |    |   Sarah address  |
        |    |------------------|
        v    |                  |                 ------------------        |
        +<---|     Message      |--------------->|                  |       |
        |    |                  |                |                  |       |
        |     ------------------                 |  Verification    |       |
        |     ------------------                 |    Function      |       |
        ---> |    Signatures    |--------------->|                  |       |
              ------------------                  ------------------        |
                                                          |                 |
                                                          v                 |
                                                         Yes/No             |
                                                                            |

hksupport, (2016), [What's the difference between public key and public address?](https://www.reddit.com/r/Bitcoin/comments/3filud/whats_the_difference_between_public_key_and/)

---

### Hierarchically Deterministic (HD) Wallets
Solution to secure privatcy
- Master private key


         ------------------         ------------------   generate   ------------------       |          ------------------
        |Master Private key|------>|    Private key   |----------> |    Public key    |------|-------> |   address        |
         ------------------   |     ------------------              ------------------       |          ------------------
                  |           |                                                              |
                  |           |+1   ------------------   generate   ------------------       |          ------------------
                  |           |--->|    Private key   |----------> |    Public key    |------|-------> |   address        |
                  |           |     ------------------              ------------------       |          ------------------
                  |           |+2   ------------------   generate   ------------------       |          ------------------
                  |           |--->|    Private key   |----------> |    Public key    |------|-------> |   address        |
                  |           |     ------------------              ------------------       |          ------------------
                  |           |+3   ------------------   generate   ------------------       |          ------------------
                  |           |--->|    Private key   |----------> |    Public key    |------|-------> |   address        |
                  |           |     ------------------              ------------------       |          ------------------
                  |           |+4   ------------------   generate   ------------------       |          ------------------
                  |           |--->|    Private key   |----------> |    Public key    |------|-------> |   address        |
                  |                 ------------------              ------------------       |          ------------------
         ------------------                                                 |
        | Master Public Key|-------------------------------------------------
         ------------------
         master pubic key can use to recreate the public key
         useful for auditor to vaerify the

Vitalik Buterin, (2013), [Deterministic Wallets, Their Advantages and their Understated Flaws](https://bitcoinmagazine.com/articles/deterministic-wallets-advantages-flaw-1385450276/)

---

## Smart Contract Intuition

### What is Etherium

Ethereum is an open-source blockchain-based platform that essentially enables hundreds of decentralized cryptocurrencies
and projects to be built and deployed without having to build their own blockchains.
With the second largest market cap in the cryptocurrency world,
Ethereum has drawn a lot of attention from investors and crypto enthusiasts alike.
Ethereum not only presents a significant change to the status quo,
it also allows for the quick development and deployment of new applications presenting niche solutions for various industries.
While Ethereum’s utility is obvious to programmers and the tech world at large,
many people who are less tech-savvy have trouble understanding it.

Alex Moskov, (2017), [What is Ethereum? | The Ultimate Beginners’ Guide](https://coincentral.com/what-is-ethereum/)

---

### What is a Smart Contract

Turing complete
* Bitcoin script - NO
* sodility - YES

Nik Custodio, (2017), [Smart Contracts for Dummies](https://medium.freecodecamp.org/smart-contracts-for-dummies-a1ba1e0b9575)

---

### Ethereum Virtual Machine & Gas
Danny Ryan, (2017), [Calculating Costs in Ethereum Contracts](https://hackernoon.com/ether-purchase-power-df40a38c5a2f)
[ETH Gas Station ](https://ethgasstation.info/index.php)
---

### Decentralized Autonomous Organizations (DAOs)
Vitalik Buterin, (2014), [DAOs, DACs, DAs and More: An Incomplete Terminology Guide](https://blog.ethereum.org/2014/05/06/daos-dacs-das-and-more-an-incomplete-terminology-guide/)

---

### The DAO Attack
Matthew Leising, (2017), [The Ether Thief](https://www.bloomberg.com/features/2017-the-ether-thief/)

---

### Soft & Hard Forks
Khaleel Kazi, (2017), [Complete Guide on Bitcoin and Blockchain Forks](https://coinpickings.com/complete-guide-bitcoin-blockchain-forks/)

Hard fork : Loosen rule

Soft fork :
- Tighten rule
- Backward compatible

---

### Initial Coin Offerings (ICO's)
Alex Wilhelm, (2017), [WTF is an ICO?](https://techcrunch.com/2017/05/23/wtf-is-an-ico/)

---

### ICO Case Study
Praveen Krishnan, (2018), [What the heck is an ICO?](https://coinpickings.com/complete-guide-bitcoin-blockchain-forks/)

Andrew Finn, (2018), [How Crypto Tokens will Enable the Disruption of Businesses like Uber and Airbnb](https://finnscave.com/2018/02/07/how-crypto-tokens-will-enable-the-disruption-of-businesses-like-uber-and-airbnb/)

---

### Blockchain and Web 3.0
Matteo Gianpietro Zago, (2018), [Why the Web 3.0 Matters and you should know about it](https://medium.com/@matteozago/why-the-web-3-0-matters-and-you-should-know-about-it-a5851d63c949)
