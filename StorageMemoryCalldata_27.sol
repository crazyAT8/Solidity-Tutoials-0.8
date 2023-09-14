// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

// Data locations - storage, memory and calldata

contract DataLocation {
    struct MyStruct {
        uint foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    function examples(uint[] memory y, string memory s) external returns (
        uint[] memory){
        myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});

        MyStruct storage myStruct = myStructs[msg.sender];
        // this is telling solidity that the variable your about to use should point back to the storage
        myStruct.text = "foo";

        MyStruct memory readOnly = myStructs[msg.sender];

        uint[] memory memArr = new uint[](3);
        memArr[0] = 234;
        return memArr;
    }

    function examples2(uint[] calldata x, string calldata t) external returns (
        uint[] memory){
        myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});

        MyStruct storage myStruct = myStructs[msg.sender];
        // this is telling solidity that the variable your about to use should point back to the storage
        myStruct.text = "foo";

        MyStruct memory readOnly = myStructs[msg.sender];
        readOnly.foo = 456; // modifiable only as a local variable

        _internal(y);

        uint[] memory memArr = new uint[](3);
        memArr[0] = 234;
        return memArr;
    }

    function _internal(uint[] calldata x) private {
        uint x = y[0];
    }
    // using call data here instead of memory makes one less copy of the data
    // only saves a copy in the internal function and not in memory
}