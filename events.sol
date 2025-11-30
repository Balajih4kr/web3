// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentsDetails{

// Declaring all events 
event StudentAdded (address wallet, string name, uint256 age);
event StudentUpdated (address wallet, string name, uint256 age);
event StudentDeleted(address wallet, string name, uint256 age);


    struct Students{
        string name;
        uint256 age;
        address wallet;
    }

    Students[] public students;

function addStudent(string memory _name, uint256 _age) public {
    students.push(Students(_name,_age,msg.sender));

    emit StudentAdded (msg.sender,_name,_age);
}

function UpdateStudent(uint _index, string memory _name, uint _age) public {
    require(_index < students.length, "invalid index");
    Students storage s = students[_index];
    s.name = _name;
    s.age = _age;

    emit StudentUpdated(s.wallet, s.name, s.age);
}

function DeleteStudent(uint _index) public {
    require(_index < students.length, "invalid index");
    Students storage s = students[_index];
    delete students[_index];

    emit StudentDeleted(s.wallet, s.name, s.age);
}

function getStudent(uint _index) public view returns (address, string memory, uint) {
    require(_index < students.length, "Invalid index");
    Students storage s = students[_index];
    return (s.wallet,s.name,s.age);
}


}
