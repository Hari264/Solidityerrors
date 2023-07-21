// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Error {
    function testRequire(uint _i) public pure {
 
        require(_i >= 10 && _i <= 100 , "Input must be between 10 to 100");
    }

    function testRevert(uint _i) public pure {

        if (_i <= 10 && _i>=100) {
            revert("Input must be greater than 10 msg by revert");
        }
    }

    uint public num;
//check unvarients
    function testAssert() public view {
       
        assert(num != 0);
    }

   
}
