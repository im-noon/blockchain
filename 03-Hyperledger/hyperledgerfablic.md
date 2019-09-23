# Hyperledger Fabric
Hyperledger Fabric is a platform for distributed ledger solutions underpinned by a modular architecture delivering high degrees of confidentiality, resiliency, flexibility, and scalability. It is designed to support pluggable implementations of different components and accommodate the complexity and intricacies that exist across the economic ecosystem.

We recommend first-time users begin by going through the rest of the introduction below in order to gain familiarity with how blockchains work and with the specific features and components of Hyperledger Fabric.

Once comfortable — or if you’re already familiar with blockchain and Hyperledger Fabric — go to Getting Started and from there explore the demos, technical specifications, APIs, etc.

## Key Concepts
### [Hyperledger Fabric Functionalities](https://hyperledger-fabric.readthedocs.io/en/latest/functionalities.html)
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


### Hyperledger Fabric Model
This section outlines the key design features woven into Hyperledger Fabric that fulfill its promise of a comprehensive, yet customizable, enterprise blockchain solution:

- Assets — Asset definitions enable the exchange of almost anything with monetary value over the network, from whole foods to antique cars to currency futures.
- Chaincode — Chaincode execution is partitioned from transaction ordering, limiting the required levels of trust and verification across node types, and optimizing network scalability and performance.
- Ledger Features

    The ledger is the sequenced, tamper-resistant record of all state transitions in the fabric. State transitions are a result of chaincode invocations (‘transactions’) submitted by participating parties. Each transaction results in a set of asset key-value pairs that are committed to the ledger as creates, updates, or deletes.

    The ledger is comprised of a blockchain (‘chain’) to store the immutable, sequenced record in blocks, as well as a state database to maintain current fabric state. There is one ledger per channel. Each peer maintains a copy of the ledger for each channel of which they are a member.

    Some features of a Fabric ledger:

    - Query and update ledger using key-based lookups, range queries, and composite key queries
    - Read-only queries using a rich query language (if using CouchDB as state database)
    - Read-only history queries — Query ledger history for a key, enabling data provenance scenarios
    - Transactions consist of the versions of keys/values that were read in chaincode (read set) and keys/values that were written in chaincode (write set)
    - Transactions contain signatures of every endorsing peer and are submitted to ordering service
    - Transactions are ordered into blocks and are “delivered” from an ordering service to peers on a channel
    - Peers validate transactions against endorsement policies and enforce the policies
    - Prior to appending a block, a versioning check is performed to ensure that states for assets that were read have not changed since chaincode execution time
    - There is immutability once a transaction is validated and committed
    A channel’s ledger contains a configuration block defining policies, access control lists, and other pertinent information
    - Channels contain Membership Service Provider instances allowing for crypto materials to be derived from different certificate authorities
- Privacy — Channels and private data collections enable private and confidential multi-lateral transactions that are usually required by competing businesses and regulated industries that exchange assets on a common network.
    - Hyperledger Fabric employs a ledger per channel.
    - Chaincode are preset to modify the state of ledger over the channels.
    - A ledger exists in the scope of a channel.
    - Participants can connect to one or more channel in a Fabric network.
    - Data can fucther be obfuxcated by encrypting the data before putting up on a channel.
    - Channels provide fabrication of assets an particiants over the Fabric network.

- Security & Membership Services — Permissioned membership provides a trusted blockchain network, where participants know that all transactions can be detected and traced by authorized regulators and auditors.
    - Hyperledger Fabric underpins a transactional network where all participants have known identities. Public Key Infrastructure is used to generate cryptographic certificates which are tied to organizations, network components, and end users or client applications. As a result, data access control can be manipulated and governed on the broader network and on channel levels. This “permissioned” notion of Hyperledger Fabric, coupled with the existence and capabilities of channels, helps address scenarios where privacy and confidentiality are paramount concerns.

- Consensus — A unique approach to consensus enables the flexibility and scalability needed for the enterprise.
    - In distributed ledger technology, consensus has recently become synonymous with a specific algorithm, within a single function. However, consensus encompasses more than simply agreeing upon the order of transactions, and this differentiation is highlighted in Hyperledger Fabric through its fundamental role in the entire transaction flow, from proposal and endorsement, to ordering, validation and commitment.

## [Identity](https://hyperledger-fabric.readthedocs.io/en/latest/identity/identity.html)
### What is an Identity?
The different actors in a blockchain network include peers, orderers, client applications, administrators and more.

Each of these actors — active elements inside or outside a network able to consume services — has a digital identity encapsulated in an X.509 digital certificate.

These identities really matter because they **determine the exact permissions over resources and access to information that actors have in a blockchain network**.

A digital identity furthermore has some additional attributes that Fabric uses to determine permissions, and it gives the union of an identity and the associated attributes a special name — **principal**. Principals are just like userIDs or groupIDs, but a little more flexible because they can include a wide range of properties of an actor’s identity, such as the actor’s organization, organizational unit, role or even the actor’s specific identity. When we talk about principals, they are the properties which determine their permissions.

For an identity to be verifiable, it must come from a trusted authority. A <span style="color: pink">membership service provider</span> (MSP) is how this is achieved in Fabric. More specifically, an MSP is a component that defines the rules that govern the valid identities for this organization. The default MSP implementation in Fabric uses X.509 certificates as identities, adopting a traditional Public Key Infrastructure (PKI) hierarchical model.

### What are PKIs?
**A public key infrastructure (PKI) is a collection of internet technologies that provides secure communications in a network**. It’s PKI that puts the S in **HTTPS** — and if you’re reading this documentation on a web browser, you’re probably using a PKI to make sure it comes from a verified source.

![](https://hyperledger-fabric.readthedocs.io/en/latest/_images/identity.diagram.7.png)


A PKI is comprised of Certificate Authorities who issue digital certificates to parties (e.g., users of a service, service provider), who then use them to authenticate themselves in the messages they exchange with their environment.

A CA’s Certificate Revocation List (CRL) constitutes a reference for the certificates that are no longer valid. Revocation of a certificate can happen for a number of reasons. For example, a certificate may be revoked because the cryptographic private material associated to the certificate has been exposed._

There are four key elements to PKI:

- Digital Certificates
- Public and Private Keys
- Certificate Authorities
- Certificate Revocation Lists

Let’s quickly describe these PKI basics, and if you want to know more details, Wikipedia is a good place to start.

### Digital Certificates
A digital certificate is a document which holds a set of attributes relating to the holder of the certificate. The most common type of certificate is the one compliant with the X.509 standard, which allows the encoding of a party’s identifying details in its structure.

Digital Certificate is created using Cyrptography. Any tempering will invalidate the certificate. Cryptography allow the actors to present their certificate to others to prove her identity as long as the other party trusts the certificate issuer, know as a **Certificate Authority (CA)**. Till the point, CA keeps specific cryptographic information securely(own provate signing key), anyone reading the certificate ca be sure that the information about the actor has not tempered.
