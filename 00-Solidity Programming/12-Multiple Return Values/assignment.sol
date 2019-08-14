pragma solidity >= 0.5.1;


contract Assignments {
    function singleReturnValue(uint a, uint b) public pure returns(uint) {
        return a + b;
    }

    function caller() public pure returns(uint) {
        return singleReturnValue({b:4, a:8});
    }

    function multipleReturnValue(uint a, uint b, uint c) public pure returns(uint, uint, uint) {
        return(a, b, c);
    }

    function callerAll() public pure returns(uint, uint, uint) {
        (uint x, uint y, uint z) = multipleReturnValue(4, 5, 6);
        (x,y) = (y, x);
        (x,,) = multipleReturnValue(5, 10, 15);
        (,,z) = multipleReturnValue(10, 20, 30);

        return(x, y, z);
    }
}
