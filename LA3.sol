// SPDX-License-Identifier: MIT
pragma solidity > 0.7.0;

contract bank{
    mapping (address=>uint) public user_account;
    mapping (address=>bool) public user_exists;

    function create_account() public payable returns (string memory) {
        require(user_exists[msg.sender]==false,"Account exists");
        user_exists[msg.sender]=true;
        return "Account created";
    }

    function deposit(uint amount) public payable returns (string memory){
        require(user_exists[msg.sender]==true,"Account does not exits");
        require(amount>0,"Amount should be greater than zero");
        user_account[msg.sender]+=amount;
        return "Amount deposited";
    }

    function withdrawl(uint amount) public payable returns (string memory){
        require(user_exists[msg.sender]==true,"Account does not exists");
        require(amount>0,"Amount greater than 0");
        require(user_account[msg.sender]>=amount,"Insufficient balance");
        user_account[msg.sender]-=amount;
        return "Amount withdrawl";
    } 

    function account_balance() public view returns (uint){
        return user_account[msg.sender];
    }

    function account_exits() public view returns (bool){
        return user_exists[msg.sender];
    }
}