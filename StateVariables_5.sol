// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract StateVariables {
    uint public myUnit = 123;   

    function food() external {
        uint notStateVariable = 456;
    }
}

// data that is stored on the blockchain
// inside of a contract but outside of a function