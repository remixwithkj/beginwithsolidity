//SPDX-License-Identifier: MIT

//pragma solidity ^0.8.4;
pragma solidity ^0.8.3;
//pragma solidity ^0.5.13;
//pragma solidity ^0.6.0;

contract excepsol1 {


    address payable public owner;

    constructor() public {
        owner = payable(msg.sender);
    }

    mapping(address => uint64) public balanceReceived;

    function destroyContract() public {
        require(msg.sender == owner, "you are not autorised");
        selfdestruct(owner);
    }


    function receiveMoney() public payable {
        assert(msg.value == uint64 (msg.value));
        assert (balanceReceived[msg.sender]+ uint64(msg.value) >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += uint64(msg.value);
    }

    function withdrawMoney (address payable _to, uint64 _amount) public {
        require(_amount <= balanceReceived[msg.sender], "Not enough balance");
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

     fallback() external payable {
        receiveMoney();
    }
}
