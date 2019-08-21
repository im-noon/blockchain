pragma solidity ^0.5.1;

contract FundRaising {
    mapping(address => uint) public contributors;
    address public admin;
    uint public numOfContributors;
    uint public minimumContribution;
    uint public deadline;
    uint public goal;
    uint public raisdedAmount = 0;

    struct Request {
        string description;
        address recipient;
        uint value;
        uint numOfVoters;
        bool completed;// voted validatiton
        mapping(address => bool) voters;
    }

    Request[] public requests;

    modifier onlyAdmin() {
        require(msg.sender == admin);
        _;
    }

    event ContributeEvent(address sender, uint value);
    event CreateRequestEvent(string _desc, address _recipient, uint _value);
    event MakePaymentEvent(address _recipient, uint _value);

    constructor(uint _goal, uint _deadline) public {
        goal = _goal;
        deadline = now + _deadline;

        admin = msg.sender;
        minimumContribution = 10; //should not hard code
    }

    function contribute() public payable {
        require(now < deadline);
        require(msg.value >= minimumContribution);

        if(contributors[msg.sender] == 0) {
            numOfContributors++;
        }

        contributors[msg.sender] += msg.value;

        // increment balance
        raisdedAmount += msg.value;

        emit ContributeEvent(msg.sender, msg.value);
    }

    // check fund
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    // refund
    function getRefund() public {
        require(now > deadline);
        require(raisdedAmount < goal);
        require(contributors[msg.sender] > 0);

        address payable recipient = msg.sender;
        uint value = contributors[msg.sender];

        recipient.transfer(value);
        contributors[msg.sender] = 0;
    }

    // spending
    function creatRequest(string memory _desc, address _recipient, uint _value) public onlyAdmin {
        Request memory newReques = Request({
            description: _desc,
            recipient: _recipient,
            value: _value,
            completed: false,
            numOfVoters: 0
        });
        requests.push(newReques);

        emit CreateRequestEvent(_desc, _recipient, _value);
    }

    // voted request
    function voteRequst(uint index) public {
        Request storage thisRequest = requests[index];

        // is contributor
        // is not vote before
        require(contributors[msg.sender] > 0);
        require(thisRequest.voters[msg.sender] == false);

        thisRequest.voters[msg.sender] = true;
        thisRequest.numOfVoters++;
    }

    // make payment
    function makePayment(uint index) public onlyAdmin {
        Request storage thisRequest = requests[index];

        require(thisRequest.completed == false);
        require(thisRequest.numOfVoters > numOfContributors/2);// more than 50% voted

        address payable recipient = address( uint160(thisRequest.recipient) );
        recipient.transfer(thisRequest.value); // transcfer money to recipient
        thisRequest.completed = true;

        emit MakePaymentEvent(thisRequest.recipient, thisRequest.value);
    }
}
