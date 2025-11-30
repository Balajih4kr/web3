// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// events for transctions and withdrawal
contract SecureTranscation{


event ETHdeposited(address wallet, uint userBalance, string name);
event ETHwithdrwaled(address wallet, uint userBalance, string name);
event ETHbalanceChecked(address wallet, uint userBalance, string name);


// Making components for users

struct Users{
    string name;
    uint userBalance;
    address wallet;
    uint user_Withdraw_Count;
    uint user_Deposit_Count;
}

// Mapping for tracking the Users

mapping (address => Users) public users;

// set users function call() here

function setUser(string memory _name) public
{
    Users storage user = users[msg.sender];

    user.name = _name;
    user.user_Deposit_Count = 0;
    user.user_Withdraw_Count = 0;
    user.userBalance = 0;
    user.wallet = msg.sender;
}

// function deposit

function deposit() public payable 
{
    require(bytes(users[msg.sender].name).length > 0, "Users not Registered");

    require(users[msg.sender].user_Deposit_Count < 2, "deposit limit exist");

    users[msg.sender].userBalance += msg.value;
    users[msg.sender].user_Deposit_Count += 1;

    emit ETHdeposited(msg.sender, users[msg.sender].userBalance, users[msg.sender].name);
}

// function withdraw

function withdraw(uint _amount) public 
{
    Users storage user = users[msg.sender];
    require(user.user_Withdraw_Count < 2, "withdraw limit exist");
    require(user.userBalance >= _amount, "Insufficient balance");

    user.userBalance -= _amount;
    user.user_Withdraw_Count += 1; 


    (bool sent, ) = payable (msg.sender).call{value: _amount}("");
    require(sent, "Failed to send ETH");

    emit ETHwithdrwaled(user.wallet, user.userBalance, user.name);
}

// Balance Check of User

function getBalance() public returns(string memory, uint) {
        Users storage user = users[msg.sender];
        emit ETHbalanceChecked(user.wallet, user.userBalance, user.name);
        return (user.name, user.userBalance);
    }

}





