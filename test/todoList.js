const TodoList = artifacts.require('../contracts/TodoList.sol');

const expect = require('chai').expect;

let contractInstance = '';

contract('TodoList', accounts => {
    'use strict'
    beforeEach(async () => {
        contractInstance = await TodoList.deployed();
    });

    it('should add a to-do note successfully with a short text of 20 letters', async () => {
        'use strict';
        await contractInstance.addTodo(web3.toHex('this is a short text'));
        const newAddedTodo = await contractInstance.todos(accounts[0], 0);
        const todoContent = web3.toUtf8(newAddedTodo[1]);
        expect(todoContent).to.equal('this is a short text');
    });

    it('should mark one of your to-dos as completed', async () => {
        await contractInstance.addTodo('example');
        await contractInstance.markTodoAsCompleted(0);
        const lastTodoAdded = await contractInstance.todos(accounts[0], 0);
        const isTodoCompleted = lastTodoAdded[3]; // 3 is the bool isCompleted value of the todo note
        expect(isTodoCompleted).to.equal(true);
    });

});