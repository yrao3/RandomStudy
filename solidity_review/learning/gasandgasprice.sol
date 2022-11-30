// SPDX-License-Identifier: MIT


// tx fee = gas used * gas price
// gas - unit of computation 
// x + y  (10 gas) uint x = 1 (assigning 5 gas) written in ethereum white paper
// gas price - ether / gas (how much ether you are willing to pay for 1 gas)
// gas limit - set by you (max gas you are willing to use)
// block gas limit - set by network
// higher gas limit  ---> many computations
// lower gas limit ---> few computations
// higher gas prcie ---> high gas price short waiting time
// lower gas price ---> low gas price long waiting time

pragma solidity ^0.8.0

contract Gas {
    function testGasRefund () public returns (uint) {
        return tx.gasprice;
    }

    uint public i = 0;

    function forever () public { // waste gas function. can never stop until gas limit is reached

        while(true) {
            i += 1;
        }
    }
}