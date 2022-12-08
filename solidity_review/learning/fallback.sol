pragma solidity ^0.8.0;


/*
fallback function
1. receives 2300 gas from transfer and send methods
2. can receive all gas from call method.
Not recommended to write much code inside the fallback function since transfer and send can fail.
*/

contract Fallback {
    function () external payable {
        emit Log(gasleft());
    }
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendToFallback {
    function transferToFallback (address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function callFallback(address payable _to) public payable {
        (bool sent,) = _to.call.value(msg.value){""};
        require(sent, "Failed to send Ether");
    }
}
