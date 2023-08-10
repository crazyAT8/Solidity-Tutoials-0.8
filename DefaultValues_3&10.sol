// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract DefaultValues {
    bool public b;      // false
    uint public u;      // 0
    int public i;       // 0
    address public a;   // 0x0000000000000000000000000000000000000000
    bytes32 public b32; // 0x0000000000000000000000000000000000000000000000000000000000000000
} 

contract ValueTypes {
    bool public b = true;
    uint public u = 123;    // uint = uint256 0 to 2**256 - 1
                            //        uint8   0 to 2**8 - 1
                            //        uint16  0 to 2**16 - 1
    int public i = -123;    // int = int256   -2**255 to 2**255 - 1
                            //       int128   -2**127 to 2**127 - 1
                            // finding the size of a variable, may not be so readily apparent so do this
    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    address public addr = 0x31ed33b79D8f50871A9D6494bdF9cc766161862A

    // you'll be using this next variable when working with the cryptographic hash function something256
    bytes32 public b32
}