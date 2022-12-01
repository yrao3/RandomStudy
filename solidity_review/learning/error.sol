// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/*
- Assert 
    = should nver fail
    - uses up all gas
- Require 
    - validate inputs, preconditions and outputs
    -dose not use up all gas
- Revert (like require)
*/
contract Account {
    uint public balance;

    function deposit(uint _amount) public {
        uint oldBalance = balance;
        // x + y does not overflow if x + y >= x
        // balance + _amount does not overflow if balance + _amount >= balance
        uint newBalance = balance + _amountB;
        require(newBalance >= oldBalance, "Overflow");  //require will not use all the gas we send; 
        balance = newBalance; 
        assert(balance >= oldBalance); //assert will use all the gas we send; 
    }

    function withdraw(uint _amount) public {
        uint oldBalance = balance;

        require(balance <= _amount, "Underflow");
        // x - y does not underflow if x >= y
        // balance - _amount does not underflow if balance >= - _amount
        if (balance < _amount) {
            revert("Underflow");
        }
        balance -= _amount; 
        assert(balance <= oldBalance);
    }
}