//SPDX-License-Identifier: MIT

//pragma solidity ^0.8.4;
//pragma solidity ^0.8.1;

pragma solidity 0.6.12;

contract ExceptionExample {

    mapping(address => uint) public balanceReceived;

    function receiveMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= balanceReceived[msg.sender],"Don't be greedy withdraw only as much as you deposited!"); 
            balanceReceived[msg.sender] -= _amount;
            _to.transfer(_amount);
    }
}

