// SPDX-License-Identifier: MIT

//view functions: not to modify states
// 1. writing to state vairables; 2. emitting events; 3. creating other contracts. 4. using selfdestruct; 5. sending ehter via calls
//6. calling any funcctions not marked view or pure 7. using low-level calls 8. using inline assembly that contrains certian opcodes.

//pure functions: not to modify states and not to read from state
//1. reading from state variables 2 accessing address.balance 3. accessing any of the members of block, tx, msg (msg.sig msg.data)
//4. calling any function not marked pure 5.using inline assembly that ontains certain opcodes.


pragma solidity ^0.8.0;

contract ViewAndPure {

    uint public x = 1;
    function addToX (uint y) public view returns (uint) {
        return x + y;
    } //valid not change state variable or call other functions
    function updateX (uint y) public view {
        x += 1;
    } //not valid, changed state vairbale 
    function foo() public {
    }
    function invalidViewFunc () public view {
        foo();
    } // not valid, called other functions besides pure or view functions.

    function add(uint i,  uint j) public pure returns (uint) {
        return i + j;
    } //valid pure function

    function invalidPureFunc () public view {
        foo();
    } // not valid, called other functions besides pure functions.

}