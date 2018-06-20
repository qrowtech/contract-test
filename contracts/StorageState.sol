pragma solidity ^0.4.23;

/* StorageState allows anyone to store a single number that is accessible 
*   by anyone publishing this number. 
*   
 */

contract StorageState {
    // unsigned integer state variable (32 bytes length) 
    uint stateData;

    // setter and getter 
    function set(uint x) public {
        stateData = x;
    }

    function get() public constant returns (uint) {
        return stateData;
    }


}