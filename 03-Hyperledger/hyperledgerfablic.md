# Introduction to Hyperledger Fabric
### [Hyperledger Fabric Functionalities](https://hyperledger-fabric.readthedocs.io/en/latest/functionalities.html)
Hyperledger Fabric is an implementation of distributed ledger technology (DLT) that delivers enterprise-ready network security, scalability, confidentiality and performance, in a modular blockchain architecture. Hyperledger Fabric delivers the following blockchain network functionalities:

- Identity management
    - To enable permissioned networks, Hyperledger Fabric provides a membership identity service that manages user IDs and authenticates all participants on the network.
    - Access control lists can be used to provide additional layers of permission through authorization of specific network operations.
    - For example, a specific user ID could be permitted to invoke a chaincode application, but be blocked from deploying new chaincode.
- Privacy and confidentiality
    - Hyperledger Fabric enables competing business interests, and any groups that require private, confidential transactions, to coexist on the same permissioned network.
    - Private channels are restricted messaging paths that can be used to provide transaction privacy and confidentiality for specific subsets of network members.
    - All data, including transaction, member and channel information, on a channel are invisible and inaccessible to any network members not explicitly granted access to that channel.
- Efficient processing
    - Hyperledger Fabric assigns network roles by node type.
    - To provide concurrency and parallelism to the network, transaction execution is separated from transaction ordering and commitment.
    - Executing transactions prior to ordering them enables each peer node to process multiple transactions simultaneously.
    - This concurrent execution increases processing efficiency on each peer and accelerates delivery of transactions to the ordering service.
- Chaincode functionality
    - Chaincode applications encode logic that is invoked by specific types of transactions on the channel.
    - Chaincode that defines parameters for a change of asset ownership, for example, ensures that all transactions that transfer ownership are subject to the same rules and requirements.
    - **System chaincode** is distinguished as chaincode that defines operating parameters for the entire channel.
    - Lifecycle and configuration system chaincode defines the rules for the channel; endorsement and validation system chaincode defines the requirements for endorsing and validating transactions.
- Modular design
    - A modular architecture to provide functional choice to network designers.
    - Specific algorithms for identity, ordering (consensus) and encryption, for example, can be plugged in to any Hyperledger Fabric network.
    - A universal blockchain architecture that any industry or public domain can adopt, with the assurance that its networks will be interoperable across market, regulatory and geographic boundaries.

### Pros of Hyperledger Fabric
- Permissioned membership feature available where you can maintain the identities of paticipants.
- Performanace, Scalability abd high level of trust.
- Rich queries feature available over the ledger, this helps you to query the ledger in the most layman terms possible.
- Modular architecture, with plug-in components available.
- Protection of Digital Keys given to the users and sensitive data. Moreover, certificates provider one additional layer of security.
- Hyperledger organizational structure elevates and incentivizes infrastructure work.
- Rich and open opportunities for more development and support.
- A strong team and community back it.

### Cons of Hyperledger Fabric
- It is relatively new, thus not yet adoped throughout the blockchain ecosystem.
- There is no coin or cryptocurrency involed over the Hyperledger, although it's possible to develop native digital tokens with chaincode, native currencies like Bitcoin or Ethers are not supported.
- Hyperledger is focused exclusively on enterprise transaction-based applications.
- Still under adoption, although POCs are available but complete deployment is still lacking.
