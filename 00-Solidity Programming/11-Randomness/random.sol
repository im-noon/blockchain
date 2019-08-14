pragma solidity > 0.5.0;

contract Random {

    function unsafeBlockRandom () public view returns(uint) {
        return uint(blockhash(block.number - 1)) % 100;
    }

}
