pragma solidity >= 0.5.0;

contract Assembly {

    function nativeLoops() public pure returns(uint _ret) {
        for (uint i = 0; i < 10; i++) {
            _ret++;
        }
    }

    function asmForLoops() public pure returns(uint _ret) {
        assembly {
            let i := 0
            for { } lt(i, 10) { } {     // while(i < 0x100)
                i := add(i, 1)
                _ret := add(_ret, 1)
            }
        }
    }

    function nativeConditional(uint _value) public pure returns(uint) {
        if(5 == _value){
            return 55;
        }
        else if (6 == _value) {
            return 66;
        }

        return 11;
    }

    function asmSwitcConitional(uint _value) public pure returns(uint _ret) {
        assembly {
            switch _value
            case 5 {
                _ret := 55

            }
            case 6 {
                _ret := 66

            }
            default {
                _ret := 11
                }
        }
    }

    function asmReturn(uint _value) public pure returns(uint) {
        assembly {
            let _ptr := add(msize(), 1)
            mstore(_ptr, _value)
            return(_ptr, 0x40)
        }
    }
}
