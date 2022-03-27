// SPDX-License-Identifier: GPL-3.0

//pragma solidity ^0.5.13;
pragma solidity ^0.8.1;

contract ssue {
    address owner;
    bool public paused; //pausing a contract

    constructor() public {
        owner=msg.sender;
    }

    function sendMoney() public payable {

    }

    function setPaused(bool _paused) public {
      require(msg.sender == owner, "illegal pause hence not allowed");
      paused=_paused;
    }

    function withdrawAllMoney(address payable _to) public {
        require(msg.sender == owner, "illegal transaction hence not allowed");
        require(!paused, "paused contract cannot execute");
        _to.transfer(address(this).balance);
    }

    function destroy(address payable _to) public {
        require(msg.sender == owner, "you can only destroy what you own");
        selfdestruct(_to);
    }
}