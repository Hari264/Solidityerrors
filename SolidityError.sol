// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ComplexErrorDemonstration {
    address public owner;
    uint256 public balance;
    mapping(address => uint256) public userBalances;

    event Deposit(address indexed user, uint256 amount);
    event Withdrawal(address indexed user, uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function.");
        _;
    }

    function deposit(uint256 amount) public {
        require(amount > 0, "Deposit amount must be greater than zero.");
        userBalances[msg.sender] += amount;
        balance += amount;
        emit Deposit(msg.sender, amount);
    }

    function withdraw(uint256 amount) public {
        require(amount > 0, "Withdrawal amount must be greater than zero.");
        require(userBalances[msg.sender] >= amount, "Insufficient balance.");
        userBalances[msg.sender] -= amount;
        balance -= amount;
        emit Withdrawal(msg.sender, amount);
    }


    function triggerRevert() public pure {
        if (true) {
            revert("This function intentionally triggers a revert error.");
        }
    }

    function triggerAssert() public pure {
        uint256 a = 1;
        uint256 b = 2;
        assert(a > b); // Triggers an assert error because the condition is not met.
    }
}
