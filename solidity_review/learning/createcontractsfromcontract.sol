pragma solidity ^0.8.0;

/*
contract that creates other contracts

how is it useful?
- pass fixed inputs to new contracts
- manage many contracts from a single contract

examples
- create a new contract
- send ether and create a new contract

*/

contract Car {
    string public model;
    address public owner;

    constructor(string memory _model, address _owner) public payable {
        model = _model;
        owner = _owner;
    }
}

contract CarFacotry{
    Car[] public cars;
    function create(address _owner, string memory _model) public {
       Car car =  new Car(_model, _owner);
       cars.push(car)
    }

    function createAndSendEther(address _owner, string memory _model) public payable {
       Car car =  (new Car).value(msg.value)(_model, _owner);
    }
}