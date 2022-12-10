pragma solidity ^0.8.0;

/*
Library 
- no storage, no ether
- helps you keep your code DRY (Don't Repeat Yourself)
    - add functionality  types
- Can save gas

Embedded or linked 
- embedded (library has only internal functions)
- must be deployed and then linked (library has public or external functions)

Examples
- safe math (prevent uint overflow)
- deleting element from array without gaps

Summary
- using A for B
    add library functions of A to type B
- Embedded - if all library functions are internal
- Deployed & linked - if not all functions are internal
    - linked libraries can save gas
*/

library SafeMath {
    function add(uint x, uint y) internal pure returns (uint) {
        uint z = x + y;
        require(z >= x, "uint overflow");
        return z;
    }
}

contract TestSafeMath {
    using SafeMath for uint;
    // using A for B
    // attach functions from library A to type B
    uint public MAX_UINT = 2 ** 256 - 1;

    function testAdd (uint x, uint y) public pure (returns uint) {
        return x.add(y);
    }
}

library Array { 
    function remove(uint[] storage arr, uint index) public {
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }
}

contract TestArray {
    using Array for uint[];

    uint[] public arr; 

    function testArrayRemove() public {
        for (uint i = 0; i <3; i++) {
            arr.push(i);
        }
        // [0, 1, 2]
        arr.remove(1);
        // [0, 2]
        assert(arr.length == 2);
        assert(arr[0] == 0);
        assert(arr[1] == 2);
    }

}