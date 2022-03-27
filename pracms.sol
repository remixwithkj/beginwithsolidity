//SPDX-License-Identifier: MIT

//pragma solidity ^0.8.4;
//pragma solidity ^0.8.1;
pragma solidity ^0.5.13;

contract pracms {


struct Payment {
    uint money;
}

 struct Balance {
        uint totalBalance;
        mapping(uint => Payment) payments;
    }

mapping(uint => Balance) public balanceReceived;

 function getvalues() public view returns (uint, uint, address, address, uint) {
        return (balanceReceived[0].totalBalance, balanceReceived[0].payments[0].money, address(this), msg.sender, 100);
    }

}

//payments[0].money;
//0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2