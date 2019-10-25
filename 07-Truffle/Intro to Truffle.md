## Intro to Truffle

The advantage of using truffle will be apparent when you are working on a larger project with multiple team members. It’s aim is to make developers life easier with the various tools and automation it gives you. Imagine trying to deploy more than 10 contracts in a particular order with dependencies between them. If you had to do this manually using remix, it will be time consuming and error prone.

### Installation
Truffle is a node package module that you can install with the following command in the terminal once you have node js installed on your system. Once installed, you can run truffle version to confirm the installation succeeded.

    npm install -g truffle

### Project Initialization
To create a new project, create a folder on your file system and cd into it from the terminal and run truffle **init** command. This will create a bunch of new files and folders for you. These boiler template code sets up the structure of a truffle project.

### Truffle Compile
In order to compile, deploy and test the Election smart contract, copy and paste the election contract code from the previous lesson into a new file called **Election.sol** inside the **contracts**/ folder within the truffle project directory. Then you can run the **truffle compile** command in the terminal. This command will automatically compile all the contracts inside the **contracts**/folder.

### Truffle Configuration

In order to use truffle to deploy and test smart contracts, truffle needs to know where to deploy them. You can configure truffle by changing the **truffle.js** configuration file. Copy and paste the following code into **truffle.js** file. Note that if you’re on windows, there is a naming conflict and you might need to change the file name to **truffle-config.js** instead. You can read more about how to resolve this issue [here](https://truffleframework.com/docs/truffle/reference/configuration#resolving-naming-conflicts-on-windows). Now start the Ganache test blockchain so that truffle can connect to it. Note that if you change the port that Ganache runs on, make sure to change this configuration file to match as well.

You need to add the following code to your truffle.js or truffle-config.js (on Windows) file. Make sure to change the <YOURAPI KEY> from the file and paste in your mnemonics.

    let HDWalletProvider = require('truffle-hdwallet-provider');
    let mnemonic = ""; // Paste in your mnemonics here for testnet
    // let mnemonic = process.env.PRIV_SEED // Use ENV variable for mainnet

    module.exports = {
      networks: {
        development: {
          host: "localhost",
          port: 8545,
          network_id: "*" // Match any network id
        },
        rinkby: {
          provider: function() {
            return new HDWalletProvider(mnemonic, "https://rinkeby.infura.io/v3/<YOUR API KEY>");
          },
          network_id: '4',
        }
      }
    };


### Truffle Migration
Now that we’ve compiled our contract and setup the configuration, we can actually deploy our contract. In order to do this we need to create migration files. Note that when you first created the project, there is already a migration file created for you inside the **migrations**/ folder called **1_initial_migration.js**. All new migration files you create should start with a number. This tells truffle the order in which migrations should happen.

Migration files are used to help you deploy your contracts and pass in the various constructor parameters. It’s a way of codifying how to deploy your contracts so that it’s consistent and predictable. You can deploy multiple contracts within a single migration file or just a single contract as well. To learn more about migration, you can check out truffle’s documentation [page](https://truffleframework.com/docs/truffle/getting-started/running-migrations) and also this article [here](https://www.sitepoint.com/truffle-migrations-explained/) as well that shows how to deal with contract dependencies.

Now let’s create a new file called 2_election_migration.js inside the migrations/ folder and copy and paste the following code.

    var Election = artifacts.require("Election");

    module.exports = function (deployer) {
        deployer.deploy(Election, "My Election");
    };

Now let’s deploy our Election contract to the Ganache test blockchain by running the following command in the terminal and you should see some output like the following. Note that if you’ve already deployed it once and want to reset your deployment, you can run **truffle migrate --reset** to force a re-deployment of all your migration scripts. By default truffle only run each migration once since in a real production environment you don’t want to re-run all of your contract deployment every time you make some changes.

    ElectionContract$ truffle migrate
    Using network 'development'.

    Running migration: 1_initial_migration.js
      Deploying Migrations...
      ... 0x8f3f6c9c435d2c124c4484aa017cc828a41a94ae123e18dd1736eb0f58898fc5
      Migrations: 0x92299e0017f9949044e7c1e644179381e516cb35
    Saving successful migration to network...
      ... 0xca9827a59795c6ceadfe45e045c7a0cd77d70415c512c791c17bc3ee30b79d26
    Saving artifacts...
    Running migration: 2_election_migration.js
      Deploying Election...
      ... 0x3e4e4d59a26f91da4fd010b89c3a236b7967ab7e538c3525abf08e2bf683e744
      Election: 0x886c32c91c2a9c6abffd3e847e99796750188c39
    Saving successful migration to network...
      ... 0x70a047b7de3f3f4a4d541eaa29830f3ce58c153bd006067a9508b2eabcbd9cdc
    Saving artifacts...

### Interacting With Contract
Now that the contract is deployed to the Ganache test blockchain, you can interact with the smart contract in a few different ways. Truffle has a console that you can use to interact with the contract programmatically with code. You can read more about truffle console [here](https://truffleframework.com/docs/truffle/getting-started/using-truffle-develop-and-the-console#console) but we’re going to use remix and connect it to our local Ganache test blockchain.

Inside remix, under the environment drop down menu in the **Run** tab, select Web3 Provider. Then input the port number Ganache is running on and connect. Remix should pick up all the local accounts in Ganache. You can load your contract by pasting in the contract address into remix in the **At Address** field. Make sure you have the source code of **Election.sol** inside of remix as well and you’ve selected the Election contract in the contract drop down menu.

Once the contract loads, you should see all the interface you normally see that you can use to interact with your contract. You should be able to see transactions inside Ganache user interface whenever you send a transaction inside remix to the contract.
