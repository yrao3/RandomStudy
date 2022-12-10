pragma solidity ^0.8.0;

/*
Import
examples
-local files
-github (only for remix) different branches

folder
|___ TestImpot.sol
|___ Foo.sol
*/

import "./Foo.sol";

contract TestImport {
    Foo foo = new Foo(); // can use Foo from Foo.sol 
    function getFooName() public view returns (string memory) {
        return foo.name();
    }
};

import "github.com/djhsfhfhfjll/jdshaflhflj/ERC20.sol";
contract MyToken is ERC20 {};