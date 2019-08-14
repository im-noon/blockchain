pragma solidity >=0.4.22 <0.7.0;

import "browser/library.sol";

contract TestLibraries {
    using IntExtended for uint;

    function testIncrement(uint _base) public returns (uint) {
        return _base.increment();
    }

    function testDecrement(uint _base) public returns (uint) {
        return _base.decrement();

    }

    function testIncrementByValue(uint _base, uint _value) public returns (uint) {
        return _base.incrementByValue(_value);
    }

    function testDecrementByValue(uint _base, uint _value) public returns (uint) {
        return _base.decrementByValue(_value);
    }
}
