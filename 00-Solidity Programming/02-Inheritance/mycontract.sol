pragma solidity >=0.4.0;

// abstract
interface Regulator {
    function checkValue(uint amount) external returns(bool);
    function loan() external returns(bool);
}

contract Bank is Regulator {
    uint private balance;

    constructor (uint amount) internal {
        balance = amount;
    }

    function deposit(uint amount) public  {
        balance += amount;
    }

    function withdraw(uint amount) public {
        if(checkValue(amount)) {
            balance -= amount;
        }
    }

    function getBalace() public view returns(uint) {
        return balance;
    }

    function checkValue(uint amount) public returns(bool) {
        return amount >= balance;
    }

    function loan() public returns(bool) {
        return balance > 0;
    }
}

contract MyContract is Bank(10) {
    string private name;
    uint private age;

    function setName(string memory newName) public {
        name = newName;
    }

    function getName() public view returns(string memory) {
        return name;
    }

    function setAge(uint newAge) public {
        age = newAge;
    }

    function getAge() public view returns(uint) {
        return age;
    }

}
