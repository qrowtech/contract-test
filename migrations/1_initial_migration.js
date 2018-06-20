// define contracts to be deployed
var TodoList = artifacts.require('../contracts/TodoList.sol');
var Migrations = artifacts.require('../contracts/Migrations.sol');
module.exports = function(deployer) {
  'use strict';
  // deploy
  deployer.deploy(TodoList);
  deployer.deploy(Migrations);
  // ... deploy more contracts 
};
