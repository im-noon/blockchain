# Cryptoeconomics
Cryptographic toolbox:

- <span style="color: #48dbfb">Hash Functions</span>
- <span style="color: #48dbfb">Digital Signatures</span>
- <span style="color: #48dbfb">ZKsnarks</span>
- <span style="color: #48dbfb">Timelocks</span>

Economic tool:
- <span style="color: #48dbfb">Tokens</span>
- <span style="color: #48dbfb">Voting Rights</span>
- <span style="color: #48dbfb">Bribing Attackers</span>
- <span style="color: #48dbfb">Auctions</span>

- Use of <span style="color: #48dbfb">incentives</span> and <span style="color: #48dbfb">cryptography</span> to design systems, applications and networks.
- Building things.
- Applied cryptography.
- Economic incentives and <span style="color: #48dbfb">economic theory</span>.
- Milti-disciplinary science.
- Enables <span style="color: #48dbfb">new types</span> of system.
- Unified approach to problem solving.

## Bitcoin as a Money
- Transaction records <span style="color: #48dbfb">valid</span> and <span style="color: #48dbfb">unalterable</span>
- No <span style="color: #48dbfb">double spending</span> of coins
- No <span style="color: #48dbfb">middleman</span> between transaction parties
- Use <span style="color: #48dbfb">incemtives</span> to encourage good and behaviour

## Cryptography
<span style="color: #48dbfb">The Hidden + Writing</span>

### Public Key Cryptography
- Also know as <span style="color: #48dbfb">asymmetric key</span> cryptography.
- Uses a pair of keys to encrypt message.
- Uses a private key, or a <span style="color: #48dbfb">secret key</span> , and a <span style="color: #48dbfb">public key</span>.
- The public key is generate from the secret key.
- Anu message encrypted with a public key can only be <span style="color: #48dbfb">decrypted with the corresponding secret key</span>.

### Cyptographic Math
### Modulus(P) and Base(G) Conditions
- Must be coprime, meaning that their <span style="color: #48dbfb">greatest common divisor</span> is 1.
- _g_ is a <span style="color: #48dbfb">primitive root modulus</span> _p_, meaning that for every number _a_ that us coprime to _p_, there exists an exponent _x_ where g<sup>x</sup> mod _p_ is congruent to _a_ mod _p_ that cycles through periods of arrangments of all the remainders modulo _p_
- These conditions allow us to easily manipulate theses numbers into aresult that us <span style="color: #48dbfb">difficult</span> to revers engineer.

    #### Proof

        Step : 1
        requirement
        P = 7
        G = 3
            each number prime
            is 3 primitive root modulo 7
        Step : 2
        Pick secret 10
            Sender1:
                A = 10
                  = 10^3 mod 7 = 4
                  broad cats to Sender2
            Sender2:
                B = 8
                  = 8^3 mod 7 = 2
                  Sender1
        Step : 3
        computation
            Sender1: receive B = 2
                S = 2^10 mod 7 = 2
            Sender2: receive A = 4
                S = 8
                  = 4^8 mod 7 = 2

### Abelian Group
Ther group of operation (multiplication) can be performed on any two elements in any order

        A^b mode P
            =
        B^a mod P
            =
        G^ab mod P
            =
        G^ba mod P


## Cryptographic Hash Function Property
- An input of any size will produce an output with a fixed size.
- The sam input will always produce the same hash.
- It is computationally infeasable for someone to figure out the input, based on the output hash.
- It is very difficult to find two inputs that would produce the same output.

## Consensus and Mining
- In a decentralized network, all nodes don't trust each other.

### The Byzantine General Problem

### Proof of Work (PoW)
- Algorithm invented in the early 90's to prevent email spamming.
- Require <span style="color: #48dbfb">intensive computation</span> before sending a message.
- Sotoshi repurposed it to solve the <span style="color: #48dbfb">double spend problem</span>.
- For the bitcoin network to achieve consensus, all nodes must agree on the same transaction history.
- Wasted <span style="color: #48dbfb">computational power</span>.
- Huge environment cost
- slow to reach consensus, which limits the network throughtput.

### Proof of Stake (PoS)
- Alternative <span style="color: #48dbfb">consensus protocol</span> to PoW.
- Must putdow a <span style="color: #48dbfb">deposit</span> to mine
- Higher deposit increase chance of being selected.
- Forfiet deposit for <span style="color: #48dbfb">malicius actions</span>.
- Minimized environment cost.
- Hardder to launch <span style="color: #48dbfb">51% attack</span>.
- Penalties for misbehaviour.
- Faster network <span style="color: #48dbfb">Throughout</span>.

### Proof od Stake Slection algorithms
![](/images/img0003.png)

- Randomized Selection
    - Selects a minder based on staked and random hash value
- Coin Age
    - Multiplies the number of coins put down by the number of days it's been deposited

## Incentives on the Blockchain
- Economics is the study of how people make choice
- Scarcity creates the tension between out infinite wants and finit resources.
![](/images/img0004.png)
- Incentives are if you can understand what makes someone choose something over somthing else, you can make them choose what you want

## Attacking the System
- Cost to attache the system <span style="color: #48dbfb">greater that the cost of helping it</span>.
- Other miners won'ts help you attack the system.
- When helping the system you are working with the other miners.

## Game Theory
The study of strategic decision making
- Nash Equaillibrium

# PoW vs PoS
- Mining is more <span style="color: #48dbfb">selective</span> in PoS.
- Penalty for cheating in PoS.
- <span style="color: #48dbfb">Cost of attack</span> is higher in PoS.
- PoS is more secure.

## Applications of Cryptoeconomics
- Build on a base layer
- Augur prediction market

### Business Implications
- Global <span style="color: #48dbfb">borderless commerce</span>.
- Banking is <span style="color: #48dbfb">decentralized</span>.
- <span style="color: #48dbfb">Decntralized</span> organizations(e.g DAO)
### Finance Implications
- Raise fund glocally through <span style="color: #48dbfb">ICOs</span>.
- Create your own currency.
- <span style="color: #48dbfb">Cryptocurrency</span> exchanges.
### Governance Implications
- <span style="color: #48dbfb">Decentralized</span> government.
- Programmable laws
- Transparent election.


# Smart Contracts
- Writen using <span style="color: #48dbfb">EVM opcodes</span>.
- Can also store data.
- Written in high-level languages (e.g. Solidity, Viper)

### How It Works
- Class containing field and methods.
- Complie Solidity to <span style="color: #48dbfb">EVM bytecode</span>.
- Send <span style="color: #48dbfb">EVM bytecode</span> to network.
- Send transactions to invoke methods.

### Gas
- Gas is a unit of computation.
- Price of gas expressed in <span style="color: #48dbfb">Ether</span>.
- Paid by sender of transaction.

### Network Characteristic
| Network | Bitcoin | Ethereum|
|---|---|---|
| Current Block Reward| 12.5 BTC| 3 ETH|
| Block Time| 10 mins | 15 sec |
| Currency Cap. | 21 million| 18 million/yr|

### Ethereum Scaling Challenges
- Throughput is less that 16 TPS
- Congestion during peak activity.
- Developing <span style="color: #48dbfb">sharding, proof of stake and state channel</span>, <span style="color: #48dbfb">proof of stake</span> and <span style="color: #48dbfb">state channel</span>.
- Emerging standards like <span style="color: #48dbfb">ERC20</span>, <span style="color: #48dbfb">ERC721</span>.

