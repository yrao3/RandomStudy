pragma solidity ^0.8.0;

/*
3 ways to send ether from a contract to another contract
1. transfer (forwards 2300 gas, throws error)
2. send (forwards 2300 gas, returns bool true or false)
3. call (forward all gas or set gas, returns bool) recommend
*/

contract SendEther {
// fallback function no name, no input no output must be external
    function () external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendEther {
    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) public payable {
        (bool sent, bytes memory data) = _to.call.value(msg.value)("");
        require(sent, "Failed to send Ether");
    }
}