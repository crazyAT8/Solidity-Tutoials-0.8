// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Function modifier - reuse code before and / or after function
// Basic, inputs, sandwich

contract FunctionModifier {
    bool public paused;
    uint public count;

    function setPause(bool _paused) external {
        paused = _paused;
    }

    modifier whenNotPaused() {
        require(!paused, "paused");
        _;
    }

    function inc() external whenNotPaused {
        // require(!paused, "paused");
        count += 1;
    }

    function dec() external whenNotPaused {
        // require(!paused, "paused");
        count -= 1;
    }

    modifier cap(uint _x) {
        require(_x < 100, "x >= 100");
        _;
    }

    function incBy(uint _x) external whenNotPaused {
        // require(_x < 100, "x >= 100");
        count += _x;
    }

    modifier sandwich() {
        // code here
        count += 10;
        _;
        // more code here
        count *= 2;
    }

    function foo() external sandwich {
        count += 1;
    }
}

// its like class in CSS
//      once you declare it once
//          then use the name of the modifier
//              in each function you'd like it to apply

// you can also specify parameters

// and there can be more code added
//      after the function executes
