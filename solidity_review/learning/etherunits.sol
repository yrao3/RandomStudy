// SPDX-License-Identifier: MIT

// Ether is used to 1. pay for block rewards 2.pay transaction fee 3. transfer btw accounts 
// Units: 1 Ether = 10^18 Wei; 1 Ether = 10^15 KWei (babbage); 1 Ether = 10^12 MWei (lovelace); 1 Ether = 10^9 GWei (Shannon); 1 Ether = 10^6 Microether (szabo); 1 Ether = 10^3 Milliether (fineey)  
// Gwei: gwei is used to set gas price: tx fee = gas used * gas price

pragma solidity ^0.8.0;

contract EtherUnits {
    uint public oneWei = 1 wei;
    uint public oneEther = 1 ether;

    function testOneWei () public pure returns (bool) {
        return 1 wei == 1;
    }

    function testOneEther () public pure returns (bool) {
        return 1 ether  == 1e18 wei;
    }
}