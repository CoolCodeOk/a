// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";

contract HelloEvent {
    constructor() {
        console.log("init contract");
    }

    // 定义事件
    event Deposit(address _from, uint _value);

    event Deposit1(address indexed _from, uint value );

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
        emit Deposit1(msg.sender, msg.value);
    }
}