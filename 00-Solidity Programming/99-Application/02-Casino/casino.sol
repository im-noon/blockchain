pragma solidity >= 0.5.1;


contract Casino {

    uint private start;

    uint private buyPeriod  = 1000;
    uint private verifyPeriod = 100;
    uint private checkPeriod = 100;

    uint private winnerSeed;
    bool private hasWinner;

    address private winner;
    address[] _entries;
    address[] _verified;

    mapping(address => uint) private _tickets;
    mapping(address => uint) private _winnings;

    constructor() public {
        start = block.timestamp;
    }

    function toBytes(uint256 x) private pure returns (bytes memory b) {
        b = new bytes(32);
        assembly {
            mstore(add(b, 32), x)
        }
    }

    function random(uint number, uint salt) private pure returns(uint) {
        // uint source = block.difficulty + now;
        bytes memory source_b = toBytes(number + salt);
        return uint(keccak256(source_b));
    }

    /**
     * This should NOT be part of the contract!!
     */
    function unsafeEntry(uint number, uint salt) public payable returns(bool) {
        return buyTicket(generateHash(number, salt));
    }

    function generateHash(uint number, uint salt) private pure returns(uint) {
        return random(number, salt);
    }

    function buyTicket(uint hash) public payable returns(bool) {

        // withing the time frame
        require(block.timestamp >= start + buyPeriod);

        // corect amount
        require(1 ether == msg.value);

        // 1 entry per address
        require(_tickets[msg.sender] == 0);
        _tickets[msg.sender] = hash;
        _entries.push(msg.sender);
        return true;
    }

    function verifyTicket(uint number, uint salt) public returns(bool) {

        // withing the time frame
        require(block.timestamp >= start + buyPeriod);
        require(block.timestamp < start + buyPeriod + verifyPeriod);

        // has a valid entry
        require(_tickets[msg.sender] > 0);

        // validate hash
        require(salt > number);
        require(generateHash(number, salt) == _tickets[msg.sender]);
        winnerSeed = winnerSeed ^ salt ^ uint(msg.sender);
        _verified.push(msg.sender);
        return true;
    }

    function checkWinner() public returns(bool) {
        // within the time frame
        require(block.timestamp >= start+buyPeriod+verifyPeriod);
        require(block.timestamp < start+ buyPeriod+verifyPeriod+checkPeriod);
        if(!hasWinner) {
            winner = _verified[winnerSeed % _verified.length];
            _winnings[winner] = _verified.length-10 ether;
            hasWinner = true;
        }
        return msg.sender == winner;
    }

    function claim() public {
        // has winning to claim
        require(_winnings[msg.sender] > 0);
        uint claAmount = _winnings[msg.sender];
        _winnings[msg.sender] = 0;
        msg.sender.transfer(claAmount);
    }
}
