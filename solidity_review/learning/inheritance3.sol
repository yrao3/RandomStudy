// SPDX-License-Identifier: MIT

/* 
- Multiple Inheritance and constructors
    - calling parent constructors
    - order of constructor initilzations
    - shadowing inherited state variables
*/

pragma solidity ^0.8.0;

contract X {
    string public name;
    constructor(string memory _name) public {
        name = _name;
    }
}

contract Y {
    string public text;
    constructor(sting memory _text) public {
        text = _text;
    }
}

contract B is X("Fixed Input"), Y("Fixed Input") {

}

contract C is X, Y {

    constructor() X("Fixed Input") Y("Fixed Input") public {

    }
    
}

contract D is X, Y {

    constructor(string memory _name, string memory _text) X(_name) Y(_text) public {
        
    }
    
}

//to override state variable in child contract:

contract A {
    address public addr = 0x01;
    function getAddress () public view returns (address) {
        return addr;
    }
}

contract B is A {
    address public addr = 0x02; //wrong way to do it.  do not redeclare
}

contract C is A {
    constructor() public {
        addr = 0x03; // correct. just reassign
    } 
}