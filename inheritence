// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    function sayHello() public pure returns(string memory) {
        return "Hello from A";
    }
}

contract B is A {
function callHello() public pure returns(string memory) {
        return sayHello();
    }
}


/**
* Function Overide
*/

contract C{
    function foo() public pure virtual returns(string memory) {
        return "calling foo()";
    }
}

contract D is C{
    function foo() public pure override returns(string memory){
        return "foo overide B";
    }
}


/***
* Function diamond method conflict
*/

contract E{
    function foo1() public pure virtual returns (string memory){
        return "foo1() gonna override";
    }
}

contract F{
    function foo1() public pure virtual returns (string memory) {
        return "same method called foo1()";
    }
}

contract G is E,F{
    function foo1() public pure override (E,F) returns (string memory){
        return E.foo1();
    }
}


/**
* Constructor inhertance
*/

contract H {
    uint public x;
    constructor(uint _x) {
        x = _x;
    }
}

contract I is H {
    // constructor() A(10) { }
}
