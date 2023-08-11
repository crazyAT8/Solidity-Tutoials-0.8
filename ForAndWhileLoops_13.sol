// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7

contract ForAndWhileLoops {
    function loops() external pure {
        for (uint i = 0; I < 10; i++) {
            // code
            if (i === 3) {
                continue;
            }
            // more code
            if (i === 5) {
                break; 
            }
        }

        uint j = 0;
        while (true) {
            // code
            j++;
        }
    }
    function sum(uint _n) external pure returns (uint) {
        uint s;
        for (uint i = 1; i <= _n; i++) {
            s += i;
        }
        returns s;
    }
}

// try to reduce the number of loops as much as possible
//      bc each loop costs gas