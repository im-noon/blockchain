# The Lottery

## Planing and design
### Lottery algorithm:
    1. The lottery start accepting transactions, anyone having an ethereum wallet can send a minimum amount of 0.01 Ether

    2. The players end Ether directly to the contract address and after that their ethereum address is registered. A user can send more transactions and do not impose the maximum allowed to be sent.

    3. There will a manager, the account that deploys the contract.

    4. At some point, randomly chosen by manager, he will pick a random winner from the players list. Only the manager is allowed to see the contract balance and to randomly select the winner.

    5. The contract will transfer the entire balance to the winner address and the lottery is reset and ready for the next round.


