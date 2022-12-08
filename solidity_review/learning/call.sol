pragma solidity ^0.8.0;

/*

call - low level method available on address type
examples
    - call existing function
    - call non - existing function (triggers the fallback function)
Summary
0. you can use call method to call other functions
1. fallback will be called if function being called does not exist
2. Not recommend to use call to call other functions since very easy to mess to function signature. 
*/

contract Reciever {
    event Received(address caller, uint amount, string message);
    function foo(string memory _message, uint _x) public payable returns (uint) {
        emit Received(msg.sender, msg.value, _message);
        return _x + 1;

    }
}

contract Caller {
    event Response(bool success, bytes data);

    function testCallFoo(address payable _addr) public payable {
        (bool success, bytes memory data) = _addr.call.value(msg.value).gas(5000)(
            abi.encodeWithSignature("foo(string,uint256)", "call foo", 123)
        );

        emit Response(success, data);
    }

    function testCallDoesNotExist(address _addr) public {

        (bool success, bytes memory data) = _addr.call.value(msg.value).gas(5000)(
            abi.encodeWithSignature("doseNotExist()")
        );

        emit Response(success, data);
    }

}