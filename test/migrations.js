var Migrations = articats.require('../contracts/Migrations.sol');

var expect = require('chai');

let contractInstance = '';

contract('Migrations', accounts => {
    'use strict';
    beforeEach(async () => {
        contractInstance = await Migrations.deployed();
    });

    // TODO define tests
    it();

});