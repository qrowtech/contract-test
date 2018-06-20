# contract-test

For testing a smart contract using truffle, ganache-cli with chai as assert engine

### Intro

Project structure


- contracts/ - where you'll store all smart contracts
    - TodoList.sol - a smart contract where one could add and complete to-dos
- migrations/  - will contain specific files where you can determine how your contracts will be deployed.
    - 1_initial_migration.s
- test/  - is tests for javascript or solidity.
    - todoList.js - where the contact tests will happen
- truffle-config.js 
- truffle.js - config file with parameters (network and such)

### Testing

1. make sure to have truffle and ganache installed, if not:
    `npm i -g truffle` and `npm i -g ganache-cli`
2. run `ganache-cli` 
3. open a new terminal and run `truffle test --dev`
4. the tests should successfully pass
5. look at the previous terminal (wherer you run ganache-cli) and examine the blockchain process