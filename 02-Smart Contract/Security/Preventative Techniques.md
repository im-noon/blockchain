## Preventative Techniques

The (currently) conventional technique to guard against under/overflow vulnerabilities is to use or build mathematical libraries which replace the standard math operators; addition, subtraction and multiplication (division is excluded as it doesn’t cause over/under flows and the EVM reverts on division by 0).

[OppenZepplin](https://github.com/OpenZeppelin/zeppelin-solidity) have done a great job in building and auditing secure libraries which can be leveraged by the Ethereum community. In particular, their Safe Math Library is a reference or library to use to avoid under/over flow vulnerabilities.

To demonstrate how these libraries are used in Solidity, let us correct the TimeLock contract, using Open Zepplin’s [SafeMath library](https://github.com/OpenZeppelin/zeppelin-solidity/blob/master/contracts/math/SafeMath.sol). The over flow-free contract would become:

    library SafeMath {

      function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
          return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
      }

      function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
      }

      function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
      }

      function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
      }
    }

    contract TimeLock {
        using SafeMath for uint; // use the library for uint type
        mapping(address => uint256) public balances;
        mapping(address => uint256) public lockTime;

        function deposit() public payable {
            balances[msg.sender] = balances[msg.sender].add(msg.value);
            lockTime[msg.sender] = now.add(1 weeks);
        }

        function increaseLockTime(uint256 _secondsToIncrease) public {
            lockTime[msg.sender] = lockTime[msg.sender].add(_secondsToIncrease);
        }

        function withdraw() public {
            require(balances[msg.sender] > 0);
            require(now > lockTime[msg.sender]);
            uint transferValue = balances[msg.sender];
            balances[msg.sender] = 0;
            msg.sender.transfer(transferValue);
        }
    }

Notice that all standard math operations have been replaced by the those defined in the SafeMath library. The TimeLockcontract no longer performs any operation which is capable of doing an under/over flow.

<span style="color: #48dbfb">Real-World Examples: PoWHC and Batch Transfer Overflow (CVE-2018–10299)</span>
A 4chan group decided it was a great idea to build a ponzi scheme on Ethereum, written in Solidity. They called it the Proof of Weak Hands Coin (PoWHC). Unfortunately it seems that the author(s) of the contract hadn’t seen over/under flows before and consequently, 866 ether was liberated from its contract. A good overview of how the underflow occurs (which is not too dissimilar to the Ethernaut challenge above) is given in [Eric Banisadar’s post](https://blog.goodaudience.com/how-800k-evaporated-from-the-powh-coin-ponzi-scheme-overnight-1b025c33b530).

Some developers also implemented a _**batchTransfer()**_ function into some [ERC20](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md) token contracts. The implementation contained an overflow. [This post](https://medium.com/@peckshield/alert-new-batchoverflow-bug-in-multiple-erc20-smart-contracts-cve-2018-10299-511067db6536) explains it, however I think the title is misleading, in that it has nothing to do with the ERC20 standard, rather some ERC20 token contracts have a vulnerable _**batchTransfer()**_ function implemented.
