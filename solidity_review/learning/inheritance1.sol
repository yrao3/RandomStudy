// SPDX-License-Identifier: MIT

/*
Examples 
- Inheritance 
    - inherit functions
    - override functions
- Passing parameters to parent conscturctor
    - fixed parameters
    - variable parameters
*/

pragma solidity ^0.8.0;

contract A {
    function getContractName() public pure returns (string memory){
        return "Contract A";
    }
}

contract B is A {
        function getContractName() public pure returns (string memory){
        return "Contract B"; //override parent contract
    }
}

contract C {
    string public name;
    constructor (string memoru _name) public {
        name = _name;
    }
}

contract D is C {
    constructor (string memory _name) A(_name) public {
        
    }

}