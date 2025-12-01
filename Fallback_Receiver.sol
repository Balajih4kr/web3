// SPDX-License-Identifier: MIT

// if Custom Error use => ^0.8.20;
pragma solidity ^0.8.0;

contract Userstorage{

    event Received(address sender, uint amount);
    event FallbackCalled(address sender, uint amount, bytes data); 
    event Withdrawn(address receiver, uint amount);

    mapping (address => uint) public balance;

    receive() external payable {
        balance[msg.sender] += msg.value;
        emit Received(msg.sender, msg.value);
    }

    fallback() external payable {
        balance[msg.sender] += msg.value;
        emit FallbackCalled(msg.sender, msg.value, msg.data);
    }

    function Withdraw(uint _amount) external  {
        require(balance[msg.sender] >= _amount, "Not enough Balance");

        balance[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);

        emit Withdrawn(msg.sender, _amount);
    }

    function myBalance() external view returns(uint) 
    { 
        return balance[msg.sender]; 
    }
}
