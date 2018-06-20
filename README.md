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

### Smart contract

Code that execute and record the state of the contract. The contract resides at a specific address on the Ethereum blochain. 


### The wierd data types

- `address`: 20 byte value (Ethereum address). Has these members/properties:
    - `balance` (uint256) - query the balance of an address  
    - `transfer(amount)` - to send Ether (units of wei) to an address  
    - `send(amount)` return (bool) - low-level counterpart of transer. If the execution fails, the current contract will not stop with an exception, but `send` will return false. The transfer fails if the call stack depth is at 1024, and fails also if the recipient runs our of gas. So always check the return value of `send`
    - `call` -  to interact with contracts that do not adhere to the ABI(?), the funciton `call` is provided which takes an artitrary number of arguments of any type. These arguments are padded to 32 bytes and concatenated. One exception is the case where the first argument is encoded to exactly four bytes. In this case, it's not padded to allow the use of function signatures here. 

Example balance and transfer:

```solidity
address x = 0x123;
address myAddress = this;
if (x.balance < 10 && myAddress.balance >= 10) x.transfer(10);
```



### Migrations

(From ethereum.stackexchange)
The Migrations.sol stores (in last_completed_migration) a number that corresponds to the last applied "migration" script, found in the migrations folder. Deploying this Migrations contract is always the first such step anyway. The numbering convention is `x_script_name.js`, with x starting at 1. Your real-meat contracts would typically come in scripts starting at 2_....)

So, as this Migrations contract stores the number of the last deployment script applied, Truffle will not run those scripts again. On the other hand, in the future, your app may need to have a modified, or new, contract deployed. For that to happen, you create a new script with an increased number that describes the steps that need to take place. Then, again, after they have run once, they will not run again.

### Testing

1. make sure to have truffle and ganache installed, if not:
    `npm i -g truffle` and `npm i -g ganache-cli`
2. run `ganache-cli` 
3. open a new terminal and run `truffle test --dev`
4. the tests should successfully pass
5. look at the previous terminal (wherer you run ganache-cli) and examine the blockchain process