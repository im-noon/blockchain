pragma solidity >0.4.99 <0.6.0;

/**
 * The simple lottery contract...
 */
contract lottery {

    address payable[] public players; // players address
    address public manager; // contract manager

    constructor() public {
        // the manager address for deployment the contract
        manager = msg.sender;
    }

    // this fallback function called when players registered the address
    function () payable external {

        // validate that players registered
        require(msg.value >= 0.01 ether);
        require(msg.sender != manager, "required manager");
        // add the address to the players list
        players.push(msg.sender);
    }

    function get_balance() public view returns(uint) {

        // only manager allowed to see the balance
        require(msg.sender == manager, "required manager");
        // return the contract balance
        return address(this).balance;
    }


    function random() public view returns(uint256) {
        return uint256(keccak256(abi.encodePacked(block.difficulty, players.length)));
    }

    function select_winner() public {
        require(msg.sender == manager, "required manager");
        uint r = random();
        uint index = r % players.length;
        uint balance = address(this).balance;
        address payable winner = players[index];

        // transfer contract balance to the winner
        winner.transfer(balance);

        // reset the players
        players = new address payable[](0);
    }
}
