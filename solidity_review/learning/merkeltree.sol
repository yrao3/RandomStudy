pragma solidity ^0.8.0;


// merkle tree
// merkle root
// merkle proof exp: compact tx in one root. 

contract MerkleProof {
    function verify(
        bytes32[] memory proof, bytes32 root, bytes leaf, uint index
    ) public pure returns (bool) {
        bytes32 hash = leaf;

        // recompute merkle root
        for (uint i = 0; i < proof.length; i++) {
            if (index % 2 == 0) {
                hash = keccak256(abi.encodePacked(hash, proof[i]));
            } else {
                hash = keccak256(abi.encodePacked(proof[i], hash));
            }

            index = index / 2;
        }

        return hash == root;
    }
}