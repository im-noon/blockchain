pragma solidity >= 0.5.1;

contract AuctionCreator {
    address[] public auctions;

    function createAuction() public {
        address newAuction = address(new Auction(msg.sender));
        auctions.push(address(newAuction));
    }
}

contract Auction {

    address payable public owner;
    // general ethe block generate every 10 second
    uint public startBlock;
    uint public endBlock;

    string public ipfsHash;

    enum State {Started, Running, Ended, Canceled}
    State public actionState;

    uint public highestBindingBind;
    address payable public highestBidder;

    mapping(address => uint) public bids;


    uint bidIncrement;

    /* constructor*/
    constructor(address creator) public {
        owner = address( uint160(creator) );
        //owner = creator;
        actionState = State.Running;

        startBlock = block.number;
        endBlock = startBlock + 40320; // valid for one week
        ipfsHash = "";
        bidIncrement = 5;
    }

    modifier notOwner() {
        require(msg.sender != owner);
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier afterStart() {
        require(block.number >= startBlock);
        _;
    }

    modifier beforeEnd() {
        require(block.number <= endBlock);
        _;
    }

    /* Place a bid*/

    function min(uint a, uint b) pure internal returns(uint) {
        if (a <= b) {
            return a;
        }
        else {
            return b;
        }
    }

    function placeBid() public payable notOwner afterStart beforeEnd returns(bool) {
        require(actionState == State.Running);
        //require(msg.value >= 0.001 ether);

        uint currentBid = bids[msg.sender] + msg.value;


        require(currentBid > highestBindingBind);

        bids[msg.sender] = currentBid;

        if(currentBid <= bids[highestBidder]) {
            highestBindingBind = min(currentBid + bidIncrement, bids[highestBidder]);
        }
        else {
            highestBindingBind = min(currentBid, bids[highestBidder] + bidIncrement);
            highestBidder = msg.sender;
        }
        return true;
    }

    /* Cancel Auction*/
    function cancelAuction() public onlyOwner {
        actionState = State.Canceled;
    }

    function finalizeAuction() public {
        require(actionState == State.Canceled || block.number > endBlock);

        require(msg.sender == owner || bids[msg.sender] > 0);

        address payable recipient;
        uint value;

        if(actionState == State.Canceled) {
            recipient = msg.sender;
            value = bids[msg.sender];
        }
        else {
            if(msg.sender == owner) {
                recipient = owner;
                value = highestBindingBind;
            }
            else {
                if (msg.sender == highestBidder) {
                    recipient = highestBidder;
                    value = bids[highestBidder] - highestBindingBind;
                }
                // neither the owner nor the highest bid
                else {
                    recipient = msg.sender;
                    value = bids[msg.sender];
                }
            }
        }
        recipient.transfer(value);
    }
}
