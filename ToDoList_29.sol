// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

// Insert, update, read from array of structs
contract ToDoList {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;
    
    function create(string calldata _text) external {
        todos.push(Todo({
            text: _text,
            completed: false
        }));
    }

    function updateText(uint _index, string calldata _text) external {
        todos[_index].text = _text;         // better if you only have one field to update

        // Todo storage todo = todos[_index];  // better if you have multiple fields to update
        // todo.text = _text;
    }

    // function updateText2(uint _index, string calldata _text) external {
    //     // 35138
    //     todos[_index].text = _text;
    //     todos[_index].text = _text;
    //     todos[_index].text = _text;
    //     todos[_index].text = _text;

    //     // 34578 gas
    //     // Todo storage todo = todos[_index];
    //     // todo.text = _text;
    //     // todo.text = _text;
    //     // todo.text = _text;
    //     // todo.text = _text;
    // }

    function get(uint _index) external view returns (string memory, bool) {
        // storage - 29397
        // memory - 29480
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }
    // this function isn't really needed bc solidity does provide one

    function toggleCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }
}