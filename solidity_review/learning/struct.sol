pragma solidity ^0.8.0;

contract Todos {
    //things to do

    // [
    //     {text: "walk the dog", completed: true},
    //     {text: "wash the dishes", completed: false},
    // ]

    // string[] public todos;
    // mapping(uint => bool) public completed;

    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string memory _text) public {
        todos.push(Todo(_text, false));
// ways to create Todo: 
        // Todo({
        //     text: _text,
        //     completed: false
        // })

        // Todo memory todo;
        // todo.text = _text;
        // // todo.completed = false; the defualt value is false. no need to declare again
    }

    function get(uint _index) public view returns (string memory, bool) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    function update(uint _index, string memory _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed =! todo.completed;
    }

}