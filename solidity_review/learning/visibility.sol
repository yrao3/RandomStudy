// SPDX-License-Identifier: MIT

/* 
- Private: only accessible inside the contract itself
- Internal: only accessible inside the contract + its child contract
- Public : accessible inside the contract + its child contract + other contracts(by any contract or account)
- External: can only be called by other contracts 
*/

pragma solidity ^0.8.0;

contract Base {

    string private privateVar = "private var"
    string public privateVar = "public var"
    string internal privateVar = "internal var"
    string external privateVar = "external var" //cannot use external in state var!!!

    function privateFunc() private pure returns (string memory) {
        return "private function called";
    }

    function publicFunc() public pure returns (string memory) {
        return privateFunc(); //fine
    }

    function internalFunc() internal pure returns (string memory) {
        return "interlnal function called"; //fine
    }

    function testInternalFunc() public pure returns (string memory) {
        return internalFunc(); //fine
    }
}

contract Child is Base {

    function testprivateFunc() public pure returns (string memory) {
        return privateFunc(); //not fine. cannot be called by child contract
    }

}

contract Child is Base {

    function testInternalFunc() public pure returns (string memory) {
        return internalFunc(); //not fine. cannot be called by child contract
    }

}