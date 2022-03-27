//SPDX-License-Identifier: MIT

//pragma solidity ^0.8.4;
pragma solidity ^0.8.1;

contract MappingsStructExample {

    mapping(address => uint) public balanceReceived;

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function sendMoney() public payable {
        balanceReceived[msg.sender] += msg.value;

    }

    function withdrawAllMoney(address payable _to) public {
        uint balanceToSend = balanceReceived[msg.sender];
        balanceReceived[msg.sender] = 0;
        _to.transfer(balanceToSend);
    }

    function withdrawSomeMoney(address payable _to1, uint _amount) public {
        require(_amount <= balanceReceived[msg.sender], "you didn't send so much ask only as much as you sent");
        balanceReceived[msg.sender] -= _amount;
        balanceReceived[msg.sender] = 0;
        _to1.transfer(_amount);
    }
}