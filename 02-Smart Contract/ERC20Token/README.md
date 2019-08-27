## ERC20 TOKEN Standard
<span style="color:red">A token</span> is desinged to represent something else, in the most cases, somthing of value but also things like voting rights, discount vouchers and so on.

<span style="color: red">ERC</span> stand for <span style="color: red">Etherium Request for Comments.</span> An ERC is a form of proposal whose purose is to define standard and prectices.

<span style="color: red">EIP</span> stand for <span style="color: red">Etherium Improvement Proposal</span> and makes changes to the actual code of Etherium.

<span style="color: red">ERC20</span> is a proposal that intends to standardize how a token contract should be defined, interact wich such a token contract and how these contracts interact with each other.

**ERC20 is a standard interface** use by applications like wallet, decentrallised exchanges and so on to interact with tokens

We need a token standard for <span style="color: red">interoperability</span>. If all tokens created on the Etherium network use the same standard, those tokens will be easily exchangeable and be able to immediatly work with dApps that use the ERC20 standards.

**We use the same wallet** in whice we store to buy, sell or transfer a token, but we are actually interacting with a contract. Ther token contract that created the tokens in the first place and that handles the allocation and tracting of those toekns across Etherium.

**A token holder has full control and complete ownership of their tokens.** The token's contract keep tract of token ownership in the same way as the Etherium network keeps track of who owns Ether.

A full compatible <span style="color: red">ERC20 Token must implement 6 functions and 2 events.</span>

### ERC20 Token : allowed, transferFrom(...), approve(...)
Let's imagine there are two users _**A**_ and _**B**_.
**A** has 1000 tokens and wants to give permission to B, which in most cases is a contract, to spend 100 of them or in other words to give permission to B to transfer 100 tokens from A account to his account.

1 A, the owner will call <span style="color: red">approve(address of B, 100)</span>. After that the <span style="color: red">allowed</span> data structure will contain the following information:
<span style="color: red">allowed[address of A][address of B] == 100</span>

2 If B want to later transfer 20 tokens from A to his account, B will execute the <span style="color: red">transferFrom()</span> function in this way:<span style="color: red">transferFrom(address of A, address of B, 20)</span>.

After calling the <span style="color: red">transferFrom()</span> function(by B), the balance of A decreased with 2o and the balance of B increased with 20 tokens and the allowed data structure will contain the following info:<span style="color: red">allowed[address of A][address of B] = 80</span>

