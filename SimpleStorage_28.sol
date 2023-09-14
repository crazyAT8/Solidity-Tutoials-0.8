// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract SimpleStorage {
    string public text;
    // since this is a public function, we don't need to write a getter function

    function set(string calldata _text) external {
        text = _text;
    }

    // you can replace calldata with memory, but calldata only makes one copy and thus saves gas
    // ex:
    // gave the input the string "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    // calldata 89626 gas
    // memory 90114 gas

    function get() external view returns (string memory) {
        return text;
    }

}