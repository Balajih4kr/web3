// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract UserStorage {

    // Custom errors
    error NotRegistered(address user);
    error NotSufficientBalance(uint requested, uint available);

    mapping(address => uint) public balance;

    // Deposit function must be payable
    function deposit() external payable {
        balance[msg.sender] += msg.value;
    }

    function withdraw(uint _amount) external {
        if (balance[msg.sender] == 0) {
            revert NotRegistered(msg.sender);
        }

        if (_amount > balance[msg.sender]) {
            revert NotSufficientBalance(_amount, balance[msg.sender]);
        }

        balance[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }
}
