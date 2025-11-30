// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract studentDetails{

struct Students{
    string name;
    uint age;
}

mapping (address => Students) public students;

function setStudents(string memory _name, uint _age) public
{
    students[msg.sender] = Students(_name,_age);
}

function getStudents(address _addr) public view returns (string memory, uint age)
{
    Students memory s = students[_addr];
    return (s.name,s.age);
}

function UpdateStudentsAge(address _addr, uint _age) public
{
    students[_addr].age = _age;
    
}

function DeleteStudents(address _addr) public{
    delete students[_addr];
}

}
