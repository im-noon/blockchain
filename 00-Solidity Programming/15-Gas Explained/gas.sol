pragma solidity >= 0.5.0;

/**
 * The contractName contract does this and that...
 */
contract Gas {

    string[] datastore;

    function cheap (uint a, uint b) public pure returns(uint c) {
        c = a + b;
    }

    function expensive (string memory val) public {
        datastore.push(val);
    }

    function average () public view returns(string memory) {
        return datastore[0];
    }

    function low () public pure returns(string memory) {
        string memory myString = "test";
        return myString;
    }
}



