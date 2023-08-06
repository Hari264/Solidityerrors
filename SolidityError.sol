// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Error {
    function testRequire(uint _i) public pure {
 
        require(_i >= 100 && _i <= 1000 , "Input must be between 100 to 1000 msg by requirea");
    }

    function testRevert(uint _i) public pure {

        if (_i <= 100 && _i>=1000) {
            revert("Input must be greater than 100 and lesser than 1000 msg by revert");
        }
    }

    uint public num;
//check unvarients
    function testAssert() public view {
       
        assert(num != 0);
    }

   
}
