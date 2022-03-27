//coding wallet with import 

//SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract SHWallet is Ownable {



    mapping(address => uint64) public balanceReceived;
    mapping(address => uint64) public allowance;



 
    function depositMoney() public payable {

    } 

    function withdrawMoney(address payable _to, uint64 _amount) public onlyOwner{
        require(_amount <= balanceReceived[msg.sender], "Not enough balance");
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
        balanceReceived[msg.sender] = balanceReceived[msg.sender] - _amount;
        _to.transfer(_amount);
    }

    fallback() external payable {
    }
    
}