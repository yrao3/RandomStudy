// SPDX-License-Identifier: MIT

// Write evetns in solidity : 3 parameters can be indexed
// using web3js to get past events and subscribe to incoming events

pragma solidity ^0.8.0;

contract Event {
    event Log(address indexed sender, string message); //can filter our sender address. 
    event AnothterLog();

    function fireEvents() public {
        emit Log(msg.sender, "Hello");
        emit Log(msg.sender, "Hi");
        emit AnothterLog();

    }
}