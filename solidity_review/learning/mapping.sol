pragma solidity ^0.8.0;

//Mapping (dict: key + value, 
// cannot directly iterate in mapping, (good for fast lookups)
// cannot get size
// - create a mapping 
// - get value
// - set value
// - delete value

contract Mapping {
    mapping(address => uint) public myMap; //key types: address, bool, uint

    function get(address _addr) public view returns (uint)  {
        return myMap[_addr];
    }

    function set(address _addr, uint _i) public  {
        myMap[_addr] = _i;
    }

    function remove(address _addr) public {
        delete myMap[_addr];
    }

}