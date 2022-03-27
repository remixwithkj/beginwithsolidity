//coding wallet without import 
//SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./Allowance.sol";

contract SHWallet is allowance {

        constructor() {
            owner = payable(msg.sender);
        }

    mapping(address => uint64) public balanceReceived;

    function depositMoney() public payable {

    } 

    event MoneySent(address indexed _benef, uint amount);
    event MoneyReceived(address indexed _benef, uint amount);
    
    function withdrawMoney(address payable _to, uint64 _amount) public onlyOwner{
        require(_amount <= address(this).balance, "Not enough funds left in the Smart Cotract - refill");
        if(_to != owner){
            reduceAllowance(_to, _amount);
        }
        _to.transfer(_amount);
        emit MoneySent(_to,_amount);

    }

    fallback() external payable {
        emit MoneyReceived(msg.sender,msg.value);
    }
    
}