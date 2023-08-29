// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Structs {
    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car public car;                                             // we can use a struct as a state variable 
    Car[] public cars;
    mapping(address => Car[]) public carsByOwner;

    function examples() external {
        Car memory toyota = Car("PathFinder", 1990, msg.sender);                            // 1.
        Car memory lambo = Car({year: 1980, model: "Lamborghini", owner: msg.sender });     // 2.
        Car memory tesla;                                                                   // 3.
        tesla.model = "Tesla";
        tesla.year = 2010;
        tesla.owner = msg.sender;

// this adds 4 cars into the array
        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);

// Don't always need to initialize a struct in memory, and then save it into a state variable
//      we can do all of that in a single line
        cars.push(Car("Ferrari", 2020, msg.sender));        // this creates a struct and immediately push it into the array

        // Car memory _car = cars[0];
        // _car.model;
        // _car.year;
        // _car.owner;

// this deletes the owner from the frist car
        Car storage _car = cars[0];
        _car.year = 1999;
        delete _car.owner;              // this will reset the owner of the car 

// this deletes the second car
        delete cars[1];

    }
}

/*
Structs allow you to group data together

    there are three ways to initialize a struct
        1. similar to how we execute a function 
            we put all the parameters into parentheses
                remember when you use "memory" on a variable
                that variable only exists when the function is called
        2. use key value pairs 
            for the parameters 
                but the order doesn't matter
        3. just define it 

    When using the keyword "storage"
        it means that we want to update the variable 
            stored inside the smart contract

    We can also us the keyword "delete"
        to reset the field stored in a struct
    and you can call delete on a struct
        to delete all the data stored in a struct

*/