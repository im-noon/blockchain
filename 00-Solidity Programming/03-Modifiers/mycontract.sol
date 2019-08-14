pragma solidity >=0.4.2;

interface Regular {
    function checkValue(uint amount) external returns (bool);
    function loan() external returns (bool);
}

contract Bank is Regular {
    uint private value;
    address private owner;

    // create modifier
    modifier ownerFunc {
        require(owner == msg.sender);
        _;
    }

    constructor (uint amount) public {
        value = amount;
        owner = msg.sender;
    }

    function deposit(uint amount) ownerFunc public {
        value += amount;
    }

    function withdraw(uint amount) ownerFunc public {
        if(checkValue(amount)) {
            value -= amount;
        }
    }

    function balance() public view returns(uint) {
        return value;
    }

    function checkValue(uint amount) public returns (bool) {
        return value >= amount;
    }

    function loan() public returns (bool) {
        return value > 0;
    }
}

contract MyContract is Bank(10) {
    string private name;
    uint private age;

    function setName(string memory newName) public {
        name = newName;
    }

    function setAge(uint newAge) public {
        age = newAge;
    }

    function getName() public view returns(string memory) {
        return name;
    }

    function getAge() public view returns(uint) {
        return age;
    }
}

contract testHandling {

    constructor() public {

    }

    function errorAssert() public pure {
        assert(1 == 2);
    }

    function errorReqire()public pure {
        require( 2 == 1);
    }

    function errorRevert() public pure {
        revert();
    }
}
