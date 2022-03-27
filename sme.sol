//SPDX-License-Identifier: MIT

//pragma solidity ^0.8.4;
pragma solidity ^0.8.1;

contract sme {

    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping;

    function setValue(uint _index) public {
        myMapping[_index]=true;
    }

    function setAddressTrue() public {
        myAddressMapping[msg.sender]=true;
    }

}