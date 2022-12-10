pragma solidity ^0.8.0;

/*
Keccak256 (cryptographic Hash function)
- what is it?
    - function that takes in arbitary size input and ouputs a data of fixws size 
    - properties
        - deterministic
            - hash(x) = h every time
        - quick to compute the hash
        - irreversible
            - given h, hard to find x such that hash(x) = h
        - samll change in input changes the output significantly 
        - collision resistant
            - hard to find x, y such that hash(x) = hash(y)

Example
- guessing game (pseudo random)
*/

contract HashFunction {
    bytes32 hash1 = keccak256(abi.encodePacked("hello", uint(1), uint(2), address(123)));
    function hash(string memory _text, uint _num, address _addr) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_text, _num, _addr));
    }

    function collision(string memory _text, string memory _anothertext) public pure returns (bytes32) {
        // AAA BBB -> AAABBB
        // AA ABBB -> AAABBB
       // return keccak256(abi.encodePacked(_text, _anothertext)); // donot use encodepacked, use encode instead
        return keccak256(abi.encode(_text, _anothertext)); 
    }

}

contract GuessTheMagicWord {
    bytes32 public answer = 0x60298;

    function guess(string memory _word) public view returns (bool) {
        return keccak256(abi.encodePacked((_word)) == answer;
    }
}