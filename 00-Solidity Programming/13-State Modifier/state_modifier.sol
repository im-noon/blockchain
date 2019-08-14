pragma solidity >= 0.5.0;


contract StateModifiers {

    uint private constant constantrVale = 99;
    uint private stateValue;

    function stateAccess() public returns(uint) {
        stateValue = 9;
        return stateValue;
    }

    function constantAccess() public view returns(uint) {
        return block.number;
    }

    function viewAccess() public view returns(uint) {
        return stateValue;
    }

    function pureAccess() public pure returns(uint) {
        return constantrVale;
    }
}
