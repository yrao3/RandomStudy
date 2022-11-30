// SPDX-License-Identifier: MIT

/*
- Inheritance (multi parents)
    - order of inheritance (base to derived)
- Two ways to call parent contracts
    - explicitly 
    - using the keyword super 
*/

pragma solidity ^0.8.0;
// case 1: A has function foo B has function bar, C inheritant A and B, C has both foo and bar
contract A {
    function foo() public pure returns (string memory) {
        return "A";
            }
}

contract B {
    function bar() public pure returns (string memory) {
        return "B";
            }

}
contract C is A, B { 
}

// case 2: A has function foo , B has function foo, C inheritant A and B, C has foo. 
contract A {
    function foo() public pure returns (string memory) {
        return "A";
            }
}

contract B {
    function foo() public pure returns (string memory) {
        return "B";
            }
}
contract C is A, B {  // A and B are both baselike. we can switch order of A B. 
    // foo will return "B"; solidity will first search for the function foo from left to right. (B to A) since B has function foo, it will return "B"
}

contract D is A, C {  // the order: most baselike to most derived 
    // foo will return "A"; 
}

// case 3: 

contract A {
    event Log(string message);

    function foo() public {
        emit Log("A.foo was called")
    }

    function bar() public {
        emit Log("A.bar was called")
    }
}

contract B is A {

    function foo() public {
        emit Log("B.foo was called")
        A.foo();
    }


    function bar() public {
        emit Log("B.bar was called")
        super.bar();
    }
}

contract C is A {
    function foo() public {
        emit Log("C.foo was called")
        A.foo();
    }

    function bar() public {
        emit Log("C.bar was called")
        super.bar();
    }
}

contract D is B, C {

}