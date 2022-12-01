pragma solidity ^0.8.0;

// Examples
// - How to write an array
// - Push, pop and length
// - Removing elements from an array


contract Array {

    uint [] public myArray;
    uint [] public myArray2 = [1, 2, 3];
    uint [10] public myFixedSizeArray;

    function push(uint i) public {
        myArray.push(i);
    }

    function pop() public {
        myArray.pop();
    }

    function getLength() public view returns (uint) {
        return myArray.length;
    }

    function remove(uint index) public {
        delete myArray[index]; //dose not change the length. only change the assigned index to default value: 0

    }
}

contract CompactArray {
    // Array = [1,2,3,4] delete index at 1: array = [1,0,3,4] replace by last element -> array = [1,4,3]
    uint [] public myArray;

    function remove(uint index) public {
        myArray[index] = myArray[myArray.length - 1];
        myArray.pop();
    }

    funciton test() public {
        myArray.push(1);
        myArray.push(2);
        myArray.push(3);
        myArray.push(4);
        // [1,2,3,4]
        remove(1);
        //should become [1,4,3]
        assert(myArray.length == 3);
        assert(myArray[0] == 1);
        assert(myArray[1] == 4);
        assert(myArray[2] == 3);

        remove(2);
        assert(myArray.length == 2);
        assert(myArray[0] == 1);
        assert(myArray[1] == 4);
        
            }
}