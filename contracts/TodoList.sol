pragma solidity ^0.4.23;

contract TodoList {

    // structs are like js objects
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
    // TODO whad is dis? 
    mapping (address => uint) public lastIds;

    // modifier to make sure that only the owners can mark to-dos as complete 
    modifier onlyOwner(address _owner) {
        require(msg.sender == _owner);
        _;
    }    

    // Add a todo to the list
    function addTodo(bytes32 _content) public {
        
        // create a Todo with the constructor Todo(id, content, owner, isCompleted, timestamp)
        // msg.sender is one who called contract
        Todo memory myNote = Todo(lastIds[msg.sender], _content, msg.sender, false, now);
        
        // add the new note to the todos array
        todos[msg.sender][lastIds[msg.sender]] = myNote;
        
        // if the lastIs of the sender address is equal or larger than 100
        if (lastIds[msg.sender] >= MAX_AMOUNT_OF_TODOS) {
            lastIds[msg.sender] = 0;
        } else {
            lastIds[msg.sender]++;
        }
    }

    // Mark a todo as completed
    function markTodoAsCompleted(uint _todoId) public onlyOwner(todos[msg.sender][_todoId].owner){
        // check so that todoId is lower than 100
        require(_todoId < MAX_AMOUNT_OF_TODOS); 
        
        // check so that the to-do is not already complete 
        require(!todos[msg.sender][_todoId].isCompleted);

        // set isComplete state to true
        todos[msg.sender][_todoId].isCompleted = true;
    }
}


