pragma solidity >= 0.5.0;

// Function Calls
contract functionCall {

    function externalCall(string calldata x) external returns(uint) {
        return 123;
    }

    function publicCall(string memory x) public returns(uint) {
        return 123;
    }
}
