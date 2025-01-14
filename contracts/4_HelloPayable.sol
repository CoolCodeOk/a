// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract HelloPayable {
    uint x;
    uint y;

    // 不带calldata给合约转账触发
    receive() external payable { 
        x = 1;
        y = msg.value;
    }


    // 带calldata，但是找不到函数签名
    fallback() external payable {
        x = 2;
        y = msg.value;
    }

    function deposit() public payable {
        x = 3;
        y = msg.value;
    }

    function getxy() public view returns (uint, uint) {
        return (x, y);
    }
}