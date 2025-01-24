// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";

// 抽象合约
// 该合约不能够创建和部署，只能够作为基类提供基础功能
// 使用 abstract 关键字
abstract contract BaseABS {
    uint256 public a;

    // 纯虚函数
    // 无函数体，由子类负责实现
    function get() public virtual;

    function set() public virtual;
}

// 继承抽象合约，必须重写所有纯虚函数，否则该合约也会被定义为抽象合约
contract BaseA is BaseABS {
    // 子类必须实现抽象合约中的纯虚函数
    function get() public pure override {
        console.log("implement get function");
    }

    function set() public pure override {
        console.log("implement set function");
    }
}
