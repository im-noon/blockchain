# Introduction to Hyperledger

## Hyperledger Framework
### [Hyperledger Burrow](https://www.hyperledger.org/projects/hyperledger-burrow)
- Hyperledger Burrowis projects hosted by The Linux Foundation.
- Originally contributed by Monax and co-sponsored by Intel.
- Provides a modular blockchain client with a permissioned smart contract interpreter partially developed to the specification of the Ethereum Virtual Machine (EVM).

### [Hyperledger Fabric](https://www.hyperledger.org/projects/fabric)
- Hyperledger Fabric is an enterprise-grade permissioned distributed ledger framework for developing solutions and applications.
- Its modular and versatile design satisfies a broad range of industry use cases.
- Offers a unique approach to consensus that enables performance at scale while preserving privacy.

### [Hyperledger Sawtooth](https://www.hyperledger.org/projects/sawtooth)
- Hyperledger Sawtooth is a modular platform for building, deploying, and running distributed ledgers.
- Distributed ledgers provide a digital record (such as asset ownership) that is maintained without a central authority or implementation.

### [Hyperledger Indy](https://www.hyperledger.org/projects/hyperledger-indy)
- Hyperledger Indy is a distributed ledger, purpose-built for decentralized identity.
- It provides tools, libraries, and reusable components for creating and using independent digital identities rooted on blockchains or other distributed ledgers so that they are interoperable across administrative domains, applications, and any other “silo.”
- Hyperledger Indy has developed specifications, terminology, and design patterns for decentralized identity along with an implementation of these concepts that can be leveraged and consumed both inside and outside the Hyperledger Consortium.

### [Hyperledger Iroha](https://www.hyperledger.org/projects/iroha)
- Hyperledger Iroha is a blockchain platform implementation and one of the Hyperledger projects hosted by The Linux Foundation.
- Hyperledger Iroha is written in C++ incorporating unique chain-based Byzantine Fault Tolerant consensus algorithm, called Yet Another Consensus and the BFT ordering service.
- The blockchain-powered applications could be written in Python, Java, JavaScript and C++ as well as for the Android and iOS mobile platforms. Hyperledger Iroha was contributed by Soramitsu, Hitachi, NTT Data and Colu.

### [Hyperledger Besu](https://www.hyperledger.org/projects/besu)
- Hyperledger Besu is an open source Ethereum client developed under the Apache 2.0 license and written in Java.
- It can be run on the Ethereum public network or on private permissioned networks, as well as test networks such as Rinkeby, Ropsten, and Görli.
- Hyperledger Besu includes several consensus algorithms including PoW, PoA, and IBFT, and has comprehensive permissioning schemes designed specifically for uses in a consortium environment.

### [yperledger Grid](https://www.hyperledger.org/projects/grid)
- Hyperledger Grid initially intends to provide reference implementations of supply chain-centric data types, data models, and smart contract based business logic – all anchored on existing, open standards and industry best practices.
- it will showcase in authentic and practical ways how to combine components from the Hyperledger stack into a single, effective business solution.

## Hyperledger Tools
### [Hyperledger Compose](https://www.hyperledger.org/projects/composer)
- Hyperledger Composer is a set of collaboration tools for building blockchain business networks that make it simple and fast for business owners and developers to create smart contracts and blockchain applications to solve business problems.
- As of the 29th August 2019, the Hyperledger Composer project is in deprecated status.
- None of the maintainers are actively developing new features.
- None of the maintainers are actively providing support via GitHub issues.

### [Hyperledger Explorer](https://www.hyperledger.org/projects/explorer)
- Hyperledger Explorer is a blockchain module and one of the Hyperledger projects hosted by The Linux Foundation.
- Designed to create a user-friendly Web application, Hyperledger Explorer can view, invoke, deploy or query blocks, transactions and associated data, network information (name, status, list of nodes), chain codes and transaction families, as well as any other relevant information stored in the ledger.
- Hyperledger Explorer was initially contributed by IBM, Intel and DTCC. Check the current status of Hyperledger Explorer here.

### [Hyperledger Cello](https://www.hyperledger.org/projects/cello)
- Hyperledger Cello is a blockchain module toolkit and one of the Hyperledger projects hosted by The Linux Foundation. - Hyperledger Cello aims to bring the on-demand “as-a-service” deployment model to the blockchain ecosystem to reduce the effort required for creating, managing and terminating blockchains.
- It provides a multi-tenant chain service efficiently and automatically on top of various infrastructures, e.g., baremetal, virtual machine, and more container platforms.
- Hyperledger Cello was initially contributed by IBM, with sponsors from Soramitsu, Huawei and Intel.

### [Hyperledger Quilt](https://www.hyperledger.org/projects/quilt)
- Hyperledger Quilt is a business blockchain tool and one of the Hyperledger projects hosted by The Linux Foundation.
- Hyperledger Quilt offers interoperability between ledger systems by implementing the Interledger protocol (also known as ILP), which is primarily a payments protocol and is designed to transfer value across distributed ledgers and non-distributed ledgers.
- The Interledger protocol provides atomic swaps between ledgers (even non-blockchain or distributed ledgers) and a single account namespace for accounts within each ledger. With the addition of Quilt to Hyperledger,
- The Linux Foundation now hosts both the Java (Quilt) and JavaScript (Interledger.js) Interledger implementations.
- Hyperledger Quilt was initially contributed by NTT Data and Ripple..

### [Hyperledger Ursa](https://www.hyperledger.org/projects/ursa)
- Hyperledger Ursa is a shared cryptographic library that would enable people (and projects) to avoid duplicating other cryptographic work and hopefully increase security in the process.
- The library would be an opt-in repository for projects (and, potentially others) to place and use crypto.
- Hyperledger Ursa consists of sub-projects, which are cohesive implementations of cryptographic code or interfaces to cryptographic code.
- There are currently two sub-projects:
    - “Base Crypto” Library – Our first sub-project will be our “base crypto” library, of which the main feature is our shared modular signature library. This has the implementation of several different signature schemes with a common API, which allows for blockchain builders to change signature schemes almost on-the-fly (or to use and support multiple signature schemes easily).
    - Z-Mix – Our second sub-project will be Z-mix. Z-mix will offer a generic way to create zero-knowledge proofs that prove statements about multiple cryptographic building blocks, including signatures, commitments, and verifiable encryption. The goal of this subproject is to provide a single flexible and secure implementation to construct such zero-knowledge proofs. Z-mix consists of C-callable code but there are also convenience wrappers for various programming languages.
