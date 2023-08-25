// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract IterableMapping {
    mapping(address => uint) public balances;
    mapping(address => bool) public inserted;
    address[] public keys;

    function set(address _key, uint _val) external {
        balances[_key] = _val;

        if(!inserted[_key]) {               // if the argument _key is not in the inserted mapping 
            inserted[_key] = true;          // then set it to true 
            keys.push(_key);                // then push it to the keys array
        }
    }

    function getSize() external view returns (uint) {
        return keys.length;
    }

    function first() external view returns (uint) {
        return balances[keys[0]];                       // will return the first address that was inserted 
    }                                                   // from which we'll get the value that is stored in the balances

    function last() external view returns (uint) {
        return balances[keys[keys.length - 1]];
    }

    function get(unint _i) external view returns (uint) {
        return balances[keys[_i]];
    }
}



/*

    if you have an array, you can get the size
        and with a for loop I can get all the elements in it
            however this is not the case for mapping
            can't get the size of a mapping
            and we can't iterate
                unless we keep track of 
                all of the keys in the mapping 
    
    we are going to be able to get
        the size of the mapping 
            and run a for loop to get all 
            of the elements inside the mapping

    for starters 
        we are mapping the address to a value 
            but to get all of the elements within the mapping
            we're going to need some new data
                we are going to need a mapping to 
                track whether a key is inserted or not
                    mapping(address => bool) public inserted;
                        now we are setting the addresses that we just put into balances to true 
            
            need to keep track of all the keys we inseted with an Array
                address[] public keys;
        
        first function will be 
            to set the balance of the mapping balances
                function set(address _key, uint _val) external {
                    balances[_key] = _val;

        next we need to keep track of 
            whether address _key is inserted or not
                if it is newly inserted
                then we'll append to the array of keys
                    by doing this we will have an array of keys
                    which we can use to get 
                        all of the values stored 
                        in the balances mapping
                            if(!inserted[_key]) {               // if the argument _key is not in the inserted mapping 
                                inserted[_key] = true;          // then set it to true 
                                keys.push(_key);                // then push it to the keys array

        how do we get the size of the balances mapping 
            since everything we inserted is stored inside the keys array 
            then all we have to do is get the length of keys 
                    function getSize() external view returns (uint) {
                        return keys.length;
                    }

        Once we know the size of the balances mapping 
            then we can run a for loop 
                to get all of the values inside the mapping 

        we return the first value stored in the balances mapping 
            we will first access the keys array
            returning an address 
                and given the address we'll access the balances mapping
                to get the uint
                                    function first() external view returns (uint) {
                                        return balances[keys[0]];                       // will return the first address that was inserted 
                                    }                                                   // from which we'll get the value that is stored in the balances

*/