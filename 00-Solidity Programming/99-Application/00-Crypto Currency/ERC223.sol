pragma solidity >= 0.5.0;

contract ERC223 {
    function transfer(address _to, uint _value, bytes memory _data) public returns (bool);
    event Transfer(address indexed _from, address indexed _to, uint value, bytes data);
}
