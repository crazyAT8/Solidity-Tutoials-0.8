// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

// Mapping
// How to declare a mapping (simple and nested)
// Set, get, delete
                                                                        // wants to check and see if David is included in the array
// ["alice", "bob", "charlie"]                                          //  running a loop cost to much money--- this array has 3 iterations each cost
// { "alice": true, "bob": true, "charlie": true }                      //      mapping you can look at everything in one iteration

contract Mapping {
    mapping(address => uint) public balances;
    mapping(address => mapping(address => bool)) public isFriend;

    function examples() external {
        balances[msg.sender] = 123;
        uint bal = balances[msg.sender];
        uint bal2 = balances[address(1)]; // 0

        balances[msg.sender] += 456; // 123 + 456 = 579

        delete balances[msg.sender]; // 0

        isFriend[msg.sender][address(this)] = true;
    }
}