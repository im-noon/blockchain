## IPFS - InterPlanetary File System

- DApps need to store/retrieve data.

- <span style="color: red">Ethereum is not fee,</span> saving data on the blockchain is **very expensive**.

- We need to modify the data storage strategy and save the data off-chain as opposed to the on-chain.

- <span style="color:red">IPFS</span> and <span style="color: red">Swarm</span> are two popular decentralized, reliable, censorship-resistant, off-chain options used for data storage.

- **Data(video, audio, document, etc) will be saved on IPFS** and on the blockchain(as a smart contract state variable) will saved **only the hash** that uniquely indentifues dara on IPFS.

- <span style="color: red">Interplanetary File System (IPFS)</span> is a protocol desinged ti create a permanent and decentralized method of storing and sharing files.

- <span style="color: red">IPFS aims to replace HTTP and build a better web.</span>

    Properties:
    - peer-to-peer, decentralized, distributed file system.
    - "data sharing network", **files are addressed based on their hash** and not on their name.
    - use for saving static content.
    - <span style="color: red">reliable, fault-tolerant, zero-downtime, censorship-resistant</span>.
    - IPFS files are chunked into blocks and saved on many IPFS peers around the internet.
- **Content-addressed vs location-addressed**
    - Location-addressed:
        - **whoever controls the location control the content**
        - **what content to return of if return any content at all.**
    - Content addressed:
        - there is no location, no one controls the file.
- Files aren't anymore accessed based on **"where they are"**(<span style="color: blue">https://www.domain.com/a.jpg</span>) but based on **"what they are"**(<span style="color: yellow">ipfs/QmenifOSDSdsfsfefegeggFslfre0tboQfds</span>)
- <span style="color: red">Pinning</span> is the mechanism that allows you to tell ipfs to always keep a given objetc local.
