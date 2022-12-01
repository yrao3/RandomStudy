// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;

contract Loop {
    uint public count;

    function loop (uint n) public {
        for (uint i = 0; i < n; i++){
            count += 1;
        }

    }
}


contract Dividend {
    address[100] public shareholders;

    function pay (uint n) public {
        for (uint i = 0; i < shareholders.length; i++){
            count += 1;
            //send ether to each holder
        }

    }
}