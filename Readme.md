## Require(),Revert() Assert() 
 This Solidity project, writes a smart contract that implements the require(), assert() and revert() statements.

## Description
This Solidity project, writes a smart contract that implements the require(), assert() and revert() statements.

1. require is used to validate inputs and conditions before execution.

2. assert is used to check for code that should never be false. Failing assertion probably means that there is a bug.

3. revert() is used abort execution and revert state changes
## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the following code into the file:
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


To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile Error.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "Error" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the  function. Click on the variables and function names that are visible in the left-hand sidebar, . Finally, click on the "transact" button to execute the function and retrieve the values and message.
