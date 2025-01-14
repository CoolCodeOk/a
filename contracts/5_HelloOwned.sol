// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract owned {
    address owner;

    constructor()  {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only owner can call this function.");
        _ ;
    }

    function transferOwner(address _new0) public onlyOwner {
        owner = _new0;
    }
}