// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// gas 2148
contract Constants {
    address public constant MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
        // use the "constant" keyword to declare a constant
        //      and by practice they usually in all caps with underscores
        // gas 387
    uint public constant MY_UINT = 123;
        // gas 307
}
    // gas 2489
contract Var {
    address public MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
}
