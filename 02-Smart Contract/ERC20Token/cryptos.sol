pragma solidity ^0.5.2;
// ----------------------------------------------------------------------------
//this ICO smart contract has been compiled and tested with the Solidity Version 0.5.2
//There are some minor changes comparing to ICO contract compiled with versions < 0.5.0
// ----------------------------------------------------------------------------

contract ERC20Interface {
    function totalSupply() public view returns (uint);
    function balanceOf(address tokenOwner) public view returns (uint balance);
    function transfer(address to, uint tokens) public returns (bool success);


    function allowance(address tokenOwner, address spender) public view returns (uint remaining);
    function approve(address spender, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract CryptosToken is ERC20Interface{
    string public name = "Cryptos";
    string public symbol = "CRPT";
    uint public decimals = 0;

    uint public supply;
    address public founder;

    mapping(address => uint) public balances;

    mapping(address => mapping(address => uint)) allowed;

    //allowed[0x1111....][0x22222...] = 100;


    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);


    constructor() public{
        supply = 300000;
        founder = msg.sender;
        balances[founder] = supply;
    }


    function allowance(address tokenOwner, address spender) view public returns(uint){
        return allowed[tokenOwner][spender];
    }


    //approve allowance
    function approve(address spender, uint tokens) public returns(bool){
        require(balances[msg.sender] >= tokens);
        require(tokens > 0);

        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }

    //transfer tokens from the  owner account to the account that calls the function
    function transferFrom(address from, address to, uint tokens) public returns(bool){
        require(allowed[from][to] >= tokens);
        require(balances[from] >= tokens);

        balances[from] -= tokens;
        balances[to] += tokens;


        allowed[from][to] -= tokens;

        return true;
    }

    function totalSupply() public view returns (uint){
        return supply;
    }

    function balanceOf(address tokenOwner) public view returns (uint balance){
         return balances[tokenOwner];
     }


    function transfer(address to, uint tokens) public returns (bool success){
         require(balances[msg.sender] >= tokens && tokens > 0);

         balances[to] += tokens;
         balances[msg.sender] -= tokens;
         emit Transfer(msg.sender, to, tokens);
         return true;
     }
}
