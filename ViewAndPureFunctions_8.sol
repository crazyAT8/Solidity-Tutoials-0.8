// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ViewAndPureFunctions {
    uint public num;

    function viewFunc() external view returns (uint) {      // just reads a state variable from the blockchain
        return num;
    }

    function pureFunc() external pure returns (uint) {      // doesn't read anything from the blockchain
        return 1;                                           // nothing from the state-variable, smart contract or blockchain
    }

// Notice the scope of the variables in each of the next two functions

    function addToNum(uint x) external view returns (uint) {
        return num + x;
    }

    function add(uint x, uint y) external pure returns (uint) {
        return x + y;
    }
}

/*
* The "pure" function in Solidity is used when you need a function that doesn't read from or modify the blockchain and
* also doesn't access any state variables within the contract. It is typically used for performing computations or transformations
* on input parameters and returning a value without any interaction with the blockchain.
*
* Here are a few practical use cases for 'pure' functions in Solidity:
*
*   1. Data transformation:
*       If you need to perform data manipulations or transformations, such as converting units, calculating hashes,
*          or encoding/decoding data, you can use 'pure' functions. These functions allow you to perform calculations 
*           or transformations on input data without requiring any blockchain interaction.
*   2. Utility functions:
*       'pure' functions can be used to define utility functions that perform specific operations but don't require 
*        any blockchain state. For example, you might have a utility function to calculate the factorial of a number, 
*        check if a string is a palindrome, or perform mathmatical calculations like exponentiation or square root.
*    3. Input validation:
*        'pure' functions can be used to validate input parameters without modifying the blockchain. For instance, you can
*         verify that the input adheres to certain constraints or perform unput sanitization. This can help ensure that the 
*         subsequent operations in your contract are performed with valid data.
*     4. Testing and debugging:
*           when writing tests for your contract or debugging code, 'pure' functions ca be useful. Since these functions don't read 
*           or modify the blockchain, they can be executed quickly and independently of the blockchain state. 
*           This allows you to test specific computations or verify expected results 
*           without the need for costly blockchain interactions
*
*    1. View Functions
*           these functions are used to read data from the blockchain.
*           They don't modify the state of the contract, which means they don't write or update any data.
*           The practical purpose of using 'view' functions is to retrieve data from the blockchain without
*           incurring any gas cost. This is useful when you want to fetch data from the contract without making any changes.
*               For instance, you might use a 'view' function to check the current balance of an account,
*                   get the value of a variable, or perform calculations on existing data.
*    2. Pure Functions: 
*           These functions are even more restricted. They don't read from or write to the blockchain.
*               Instead, they operate solely on their input parameters and return a computered result.
*                   The primary purpose of using 'pure' functions is to perform local computations that don't require any
*                   interaction with the blockchain state. Since they don't access storage or modify data
*                       'pure' functions are especially useful when you need to compute values based on provided inputs.
*                           For example, you might use a 'pure' function to perform mathematical calculations,
*                           string manipulations, or any other operation that doesn't involve blockchain data.
*
*               The practical purpose of using 'pure' functions is to 
*                   perform computations that don't require blockchain interaction.
*                       They are helpful for encapsulating logic that doesn't change the state but provides calculated results
*
*               While 'view' functions are used to read data
*                   from the blockchain without incurring gas costs
*/