pragma solidity ^0.8.0;

contract Wallet {
    // examples
    // - pyable function
    // - payable address
    // payable functions and constructors can receive ether
    // payable addresses can send ether

    event Deposit(address sender, uint amount, uint balance);
    event Withdraw (uint amount, uint balance);
    event Transfer(address to, uint amount, uint balance);

    address payable public owner;

    constructor() public payable {}

    function deposit() public payable {
        emit Deposit(msg.sender, msg.value, address(this).balance);
    }

    function notPayable() public {
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function withdraw(uint _amount) public onlyOwner {
        owner.transfer(_amount);
        emit Withdraw(_amount, address(this).balance);
    }

    function transfer (address payable _to, uint _amount) public onlyOwner {
        _to.transfer(_amount);
        emit Transfer(_to, _amount, address(this).balance);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

}