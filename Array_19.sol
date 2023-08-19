// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

// Array- dynamic or fixed size
// Initialization
// Insert (push), get, update, delete, pop, length
// Creating array in  memeory
// Returning array from function

contract Array {
    uint[] public nums;             // dynamic array
    uint[3] public numsfixed;           // fixed array

    uint[] public nums2 = [1, 2, 3];
    uint[3] public numsfixed2 = [4, 5, 6];

    function examples() external {
        nums.push(4);                   // [1, 2, 3, 4]
        uint x = nums[1];               // 2
        nums[2] = 777;                  // [1, 2, 777, 4]
        delete nums[1];                 // [1, 0, 777, 4]       calling delete doesn't shrink the size of the array
        nums.pop();                     // [1, 0, 777]
        uint len = nums.length;         // 3

        // create array in memory 
        uint[] memory a = new uint[](5);            // array memory has to be a fixed sized, so the only function that works is update
        a[1] = 123                                  // [0, 123, 0, 0, 0]
    }

    function returnArray() external view returns (uint[] memory) {              // this is not recommended, bc of the amount of gas it could take up
        return nums;
    }
}