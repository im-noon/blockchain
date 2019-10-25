### Owner Title Theft

## OnlyOwner Logic Hack
Solidity provides function modifiers, which can be used to amend the semantics of functions in a declarative way. For example, privileged functions need to check the identity or the privilege level of the caller.

    function unlockToken() onlyOwner {
      locked = false;
    }

    bool public balancesUploaded = false;
    function uploadBalances(address[] recipients, uint256[] balances) onlyOwner {
      require(!balancesUploaded);
      uint256 sum = 0;
      for (uint256 i = 0; i < recipients.length; i++) {
        balanceOf[recipients[i]] = safeAdd(balanceOf[recipients[i]], balances[i]);
        sum = safeAdd(sum, balances[i]);
      }
      balanceOf[owner] = safeSub(balanceOf[owner], sum);
    }
    function lockBalances() onlyOwner {
      balancesUploaded = true;
    }

### The Problem?
We can see from the Figure 1, sensitive functions (e.g., unlockToken / lockBalances) use the onlyOwner modifier to guarantee that only the current contract owner can call them. It seems pretty legitimate, so what’s the problem?

    contract Owned {
      address public owner;
      function Owned() {
        owner = msg.sender;
      }
      function setOwner(address _owner) returns (bool success) {
        owner = _owner;
        return true;
      }
      modifier onlyOwner {
        require(msg.sender == owner);
        _;
      }
    }

Let’s take a closer look into the AURA contract which inherits SafeMath for safe mathematical calculation and Owned for contract ownership management. Inside the Owned contract, there is a method setOwner() for changing the contract ownership, which is a highly sensitive operation. However, this sensitive method doesn’t have any function modifier, like onlyOwner, to restrict its use. Even worse, the method’s visibility is public by default, which means anyone can call it to modify owner to anyone at their choice.

Consequences
With the ownerAnyone bug to essentially change the smart contract ownership, any sensitive operations restricted by onlyOwner can be easily bypassed. For example, the unlockToken() method can be used to unlock transfer, which might be used during early stage to control token transferring. Also, the lockBalances() method can be called to set the balancesUploaded variable to true (with false as the default value), essentially locking up the uploadBalances() operation and making it no longer accessible.

    line 140) bool public balancesUploaded = false;

In other words, once balancesUploaded is set to true, uploadBalances() can never be reached, which lead to a DoS attack:

    line 142) require(!balancesUploaded);

During our investigation, we initially think there is a questionable operation in the end:

    line 148) balanceOf[owner] = safeSub(balanceOf[owner], sum);

It turns out that it is protected by safeSub(), which will revert the whole transaction if balanceOf[owner] doesn’t have enough tokens.

Lessons
Always use libraries like SafeMath for safe mathematical calculations.

Always declare your functions with right modifiers and visibilities.

Follow best practices and use audited libraries as much as possible. It will avoid simple gaps in your logic that are difficult to spot after writing said code.
