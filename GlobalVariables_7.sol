// SPDX-Licesne-Identifier: MIT
pragma solidity ^0.8.7;

contract GlobalVariables {
    function globalVars() external view returns (address, uint, uint) {
        address sender = msg.sender;                      // stores the address that calls this function as an address
        uint timestamp = block.timestamp;                 // stores the UNIX time stamp of when this function was called
        uint blockNum = block.number                      // stores the current blockchain number
        return (sender, timestamp, blockNum);
    }
}

// view functions can read data from local and global variables
