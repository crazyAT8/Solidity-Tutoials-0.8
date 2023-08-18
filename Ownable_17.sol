// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// assign ownership of the contract
//      assign who can call what 
//          reassign the owner only from the current owner

contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {                                  // function modifier where only the owner can call the contract
        require(msg.sender == owner, "not owner");
        _;
    }
// next we are going to write a function to set the new owner that only the current owner will be able to call
    function setOwner(address _newOwner) external onlyOwner {   // by adding the onlyOwner to our function statement means that only the current owner can call it
        require(_newOwner != address(0), "invalid address");
        owner = _newOwner;                                      // set the new owner as the owner
    }

    function onlyOwnerCanCallThisFunc() external onlyOwner {
        // code
    }

    function anyOneCanCall() external {
        // code
    }
}

// Deploy contract
// see who the owner is then switch accounts
//      click anyOneCanCall and get a success msg
//          click onlyOwnerCanCall and get a failure msg