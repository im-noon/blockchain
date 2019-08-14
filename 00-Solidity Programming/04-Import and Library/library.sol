pragma solidity >=0.4.22 <0.7.0;

library IntExtended {
    function increment(uint _self) public view returns(uint) {
        return _self + 1;
    }

    function decrement(uint _self) public view returns(uint) {
        return _self - 1;
    }

    function incrementByValue(uint _self, uint value) public view returns(uint) {
        return _self + value;
    }

    function decrementByValue(uint _self, uint value) public view returns(uint) {
        return _self - value;
    }
}
