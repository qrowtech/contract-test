# contract-test

### Intro

Project structure


- contracts/
    - TodoList.sol
- migrations/
    - 1_initial_migration.s
- test/
    - todoList.js
- truffle-config.js
- truffle.js

contracts/ - is where you'll store all smart contracts
migrations/ - will contain specific files where you can determine how your contracts will be deployed. 
test/ folder - is tests for javascript or solidity. 
truffle-config.js - config file with parameters
truffle.js - similar to config file

### Testing

1. make sure to have truffle and ganache installed, if not:
    `npm i -g truffle` and `npm i -g ganache-cli`
2. run `ganache-cli` 
3. open a new terminal and run `truffle test --dev`
4. the tests should successfully pass
5. look at the previous terminal (wherer you run ganache-cli) and examine the blockchain process