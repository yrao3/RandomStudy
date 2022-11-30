// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;

contract A {
//state variable
    uint public x;
    uint public y;
    address public owner;
    uint public createdAt;
//set state variable inside constructor
    constructor (uint _x, uint _y) public {
        x = _x;
        y = _y;
        owner = msg.sender;
        createdAt = block.timestamp;
    }
}