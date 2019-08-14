pragma solidity >=0.4.22 <0.7.0;

contract Transactiuon {

    event SenderLogger(address);
    event ValueLogger(uint);

    address private owner;

    modifier isOwner {
        require(owner == msg.sender);
        _;
    }

    modifier validateValue {
        assert(msg.value >= 1 ether);
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

    function () payable isOwner validateValue external {
        emit SenderLogger(msg.sender);
        emit ValueLogger(msg.value);
    }
}
