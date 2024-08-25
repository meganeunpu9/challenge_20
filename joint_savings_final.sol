/*
Joint Savings Account
---------------------

To automate the creation of joint savings accounts, you will create a solidity smart contract that accepts two user addresses that are then able to control a joint savings account. Your smart contract will use ether management functions to implement various requirements from the financial institution to provide the features of the joint savings account.

The Starting file provided for this challenge contains a `pragma` for solidity version `5.0.0`.
You will do the following:

1. Create and work within a local blockchain development environment using the JavaScript VM provided by the Remix IDE.

2. Script and deploy a **JointSavings** smart contract.

3. Interact with your deployed smart contract to transfer and withdraw funds.

*/

pragma solidity ^0.8.26;

// Define a new contract named `JointSavings`
contract JointSavings {
    address payable accountOne;
    address payable accountTwo;
    address public lastToWithdraw;
    uint public lastWithdrawAmount;
    uint public contractBalance;

  
    function withdraw(uint amount, address payable recipient) public {

        require(recipient == accountOne || recipient == accountTwo, "You don't own this account!");
        require(address(this).balance >= amount, "insufficient funds!");
        if (lastToWithdraw != recipient){
            lastTwoWithdraw = recipient;
        }

        recipient.transfer(amount);
        lastWithdrawAmount = amount;
        contractBalance = address(this).balance - amount;

    }

    // Define a `public payable` function named `deposit`.
    function deposit() public payable {
        contractBalance = address(this).balance;

    }

    /*
    Define a `public` function named `setAccounts` that receive two `address payable` arguments named `account1` and `account2`.
    */
    function setAccounts(address payable account1, address payable account2) public{
        account1 = accountOne;
        account2 = accountTwo;

    }

    fallback() external payable{}
    receive() external payable {}
}
