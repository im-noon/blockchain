# The Auction contract
Ther smart contract for a Decentralized Auction, an ebay alternative.

## Design and design

1. The Auction has: an **owner**(the person who sells a good or service), **a start and an end time**

2. The owner can cancel the auction if there is an emergency and can finalize the auction after its end time

3. People are sending ether when they are calling a function name _placBid()_. We will register in amapping the sender address and the sent value

4. Users are incentivized to bid the maximum they're willing to pay, but the are bot bound to that automatically bid up to a given amount

5. The _highestBindingBid_ is the selling price and the _highestBidder_ the person who won the auction

6. After the auction ends the owners gets the highestBindingBid and everybody else withdraws their ow send amount.

## Withdrawal pattern

1. We dont, proactively send back funds to the users that did't wind the auction, we use the withdrawal pattern.

2. We should only send ETH to a user when he explicitly request it.

3. This is the withdrawal pattern and helps us avoiding _re-entrance attacks_ that could cause unexpected behavior, including catastophic financial loss for our user.
