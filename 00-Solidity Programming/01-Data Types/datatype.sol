pragma solidity >=0.4.0 <0.7.0;


contract DataTypes {

    // Booleans
    // The possible values are constants true and false.
    bool myBool = false;

    // Integers
    // int or uint: Signed and unsigned integers of various sizes(of 8 up to 256 bits)
    int8 myInt = -128;
    uint8 myUInt = 128;

    // Fixed Point Numbers (ver 0.5.11)
    // Fixed point numbers are not fully supported by Solidity yet.
    // They can be declared, but cannot be assigned to or from.
    // Keywords ufixedMxN and fixedMxN,
    // where M represents the number of bits taken by the type and N represents how many decimal points are available.
    fixed256x8 myFixed256;
    ufixed8x1 myUFixed8;

    // String
    // String literals are written with either double or single-quotes
    string myString = "Hello world";

    //Fixed-size byte arrays
    // The value types bytes1, bytes2, bytes3, …, bytes32 hold a sequence of bytes from one to up to 32.
    // byte is an alias for bytes1.
    byte myValue;
    bytes1 myBytes1;
    bytes32 myBytes32 = "string literal";

    // Enums
    // Enums are one way to create a user-defined type in Solidity.
    // They are explicitly convertible to and from all integer types but implicit conversion is not allowed.
    enum Action {ADD, REMOVE, UPDATE}
    Action myAction = Action.ADD;

    // Address
    address myAddress;
     function assignedAddress() public {
        myAddress = msg.sender;
        myAddress.balance;
    }

    // Dynamically-sized byte array

    uint[] myIntArr = [1, 2, 3];
    function arrFunc() public {
        myIntArr.push(1);
        myIntArr.length;
        myIntArr[0];
    }

    uint[10] myFixedArr;


    struct Account {
        uint balance;
        uint dailyLimit;
    }

    Account myAccount;
    function strcutFunc() public {
        myAccount.balance = 100;
    }

    mapping (address => Account) _account;

    function () payable external {
        _account[msg.sender].balance += msg.value;
    }

    function getBalace() public view returns(uint) {
        return _account[msg.sender].balance;
    }

}
