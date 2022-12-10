pragma soidity ^0.8.0;

/*
Calling other contracts
examples:
1. call non payable function in other contracts
2. call payable functions in other contracts
Summary
1. use contract.foo() over contract.call(abi.encodeWithSignature("foo()"))
2. do not trust function calls to contracts that you don't own or control
*/


contract Callee {
    uint public x;
    uint public value;

    function setX(uint _x) public returns (uint) {
        x = _x;
        return x;
    }
    function setXAndSendEther(uint _x) public payable returns (uint, uint) {
        x = _x;
        value = msg.value;
        return (x, value);
    }
}

contract Caller {
    function setX(Callee _callee, uint _x) public {
        uint x = _callee.setX(_x);
    }

    function setXFromAddress(address _addr, uint _x) public {
        Callee callee = Callee(_addr);
        uint x  = callee.setX(_x);
    }

    function setXAndSendEther(Callee _callee, uint _x) public payable {
        (uint x, uint value) = _callee.setXAndSendEther.value(msg.value)(_x);
    }
}