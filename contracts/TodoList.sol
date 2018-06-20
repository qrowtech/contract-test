pragma solidity ^0.4.23;

contract TodoList {
    struct Todo {
        uint256 id;
        bytes32 content;
        address owner;
        bool isCompleted;
        uint256 timestamp;
    }

    uint public constant MAX_AMOUNT_OF_TODOS = 100;

    // Owner => todos
    // Array of 100 empty slots for to-do structs
    mapping (address => Todo[MAX_AMOUNT_OF_TODOS]) public todos;

    // Owner => last todo id
    mapping (address => uint) public lastIds;

    modifier onlyOwner(address _owner) {
        require(msg.sender == _owner);
        _;
    }    

    // Add a todo to the list
    function addTodo(bytes32 _content) public {
        
        // create a Todo with the constructor Todo(id, content, owner, isCompleted, timestamp)
        // msg.sender is one who called contract
        Todo memory myNote = Todo(lastIds[msg.sender], _content, msg.sender, false, now);
        // 
        todos[msg.sender][lastIds[msg.sender]] = myNote;
        if (lastIds[msg.sender] >= MAX_AMOUNT_OF_TODOS) {
            lastIds[msg.sender] = 0;
        } else {
            lastIds[msg.sender]++;
        }
    }

    // Mark a todo as completed
    function markTodoAsCompleted(uint _todoId) public onlyOwner(todos[msg.sender][_todoId].owner){
        require(_todoId < MAX_AMOUNT_OF_TODOS); // check so that todoId is lower than 100
        require(!todos[msg.sender][_todoId].isCompleted);
        todos[msg.sender][_todoId].isCompleted = true;
    }
}


