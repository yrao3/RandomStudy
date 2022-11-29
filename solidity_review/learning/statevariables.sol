// SPDX-License-Identifier: MIT

// To store 1 MB data on Ethererum: $1000 /1 ether * 10^-18 Ether/1gwei * 10gwei / gas * 640,000 gas/KB * 1024 KB/ 1MB 
// Data storage: 1. storage (permanent, like harddrive) (inside contract, outside function are state variable, and will be stored in blockchain) 2. Memory (while function call) (variable inside a function) 3. calldata
// Functions: 1. Creat transaction --> change data on blockchain which change state variable or change balance record on blockchain 2. No transaction: free to call, do not change data on blockchain (view or pure)
// solidity create getters for public state variables automatically. 


pragma solidity ^0.8.0;

contract SimpleStorage {
    string public text;

    function set (string memory _text) public { //single input _text do not need to store on chain, memory is used.
        text = _text;
    }

    function get () public view returns (string memory) { // view vs pure: view declares func does not write to blockchain;  pure declares func does not write to blockchain nor read state variable from bc.
        return text;
    }

}
