// SPDX-License-Identifier: MIT

// public function i/o restrictions
// returning multiple outputs: Named, assigend, destructuring assignments.
// invalid inputs for public functions: 1. {} maps 2. [][] multi-dimensional arrays (unfixed size) 3. array with dynamic size: not recommended. need a upper bound


pragma solidity ^0.8.0;

contract Function {
    function mapInput (mapping(uint => uint) memory map) public {
    } // cannot compile

    function multiDimDynamicSizeArrayInput(uint[][] memory _arr) public {

    }// cannot compile

    function multiDimFixedSizeArrayInput(uint[9][9] memory _arr) public {

    }// can compile

    function ArrayInput(uint[] memory _arr) public {

    }// can compile, not recommended, not reliable 

    uint Max_arr_length = 10;
    function BetterArrayInput(uint[] memory _arr) public {
        if (_arr.length > Max_arr_length) {
            // throw error
        }
    } 
}