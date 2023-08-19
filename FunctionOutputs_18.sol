// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

// Return multiple outputs
// Named outputs
// Destructing Assignment

contract FunctionOutputs {
    function returnMany() public pure returns(uint, bool) {
        return (1, true); 
    }
    function named() public pure returns(uint x, bool b) {
        return (1, true); 
    }
    function assigned() public pure returns(uint, bool) {     // this one will save you on gas
        x = 1;
        b = true;
    }

    function destructingAssignments() public pure {             // capturing the output of a function and assigning it to a variable
        (uint x, bool b) = returnMany();
        (, bool _b) = named();                              // this is saying that you don't want to use the first but want the second
    }
}