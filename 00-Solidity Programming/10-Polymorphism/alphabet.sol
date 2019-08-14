pragma solidity >= 0.5.0;

interface Letter{
    function n() external returns(uint);
}

contract A is Letter {
    function n() public returns(uint) {
        return 1;
    }
}

contract B is A {}

contract C is Letter {
    function n() public returns(uint) {
        return 2;
    }

    function x() public pure returns(string memory) {
        return "x";
    }
}

contract Alphabet {
    Letter[] private letter;

    event Printer(uint);

    constructor() public {
        letter.push(new A());
        letter.push(new B());
        letter.push(new C());
    }

    function loadRemote(address _addrX, address _addrY, address _addrZ) public {
        letter.push(Letter(_addrX));
        letter.push(Letter(_addrY));
        letter.push(Letter(_addrZ));
    }

    function printLetter() public {
        for(uint i = 0; i < letter.length; i++) {
            emit Printer(letter[i].n());
        }
    }
}
