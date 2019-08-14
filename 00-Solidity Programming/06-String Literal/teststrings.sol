pragma solidity >= 0.4.0;

import "browser/strings.sol";

contract TestString {
    using Strings for string;

    function testConcat(string memory _base) public returns (string memory) {
        return _base.concat("_suffix");
    }

    function needleInHaystack(string memory _base) public returns (int) {
        return _base.strpos("t");
    }
}
