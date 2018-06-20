var TodoList = artifacts.require('../contracts/TodoList.sol');
module.exports = function(deployer) {
  'use strict';
  deployer.deploy(TodoList);
};
