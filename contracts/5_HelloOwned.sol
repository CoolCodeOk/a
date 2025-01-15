// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";

contract owned {
    address owner;
    uint a;
    
    constructor()  {
        owner = msg.sender;
    }

    modifier onlyOwner {
        console.log("sssss");
        require(msg.sender == owner, "Only owner can call this function.");
        _ ;
    }

    function transferOwner(address _new0) public onlyOwner {
        owner = _new0;
    }

    function getOwner() public view returns (address) {
        return owner;
    }

    // 带参数的修改器
    modifier over22(uint age) {
        require(age >= 22, "too small age");
        _;
    }

    function marry(uint age) public over22(age) {

    }

    // 多修改器，按顺序执行
    modifier mf1 (uint b) {
        console.log("mf1-A");
        _;
        console.log("mf1-B");
    }

     modifier mf2 () {
        console.log("mf2-A");
        _;
        console.log("mf2-B");
    }

    modifier mf3() {
        console.log("mf3-A");
        return ;  // 这里return了，因此函数体test1不会被执行
        _;
        console.log("mf3-B");
    }


    // 多修改器的调用顺序，每个修改器中，通过 _;将函数体分为两部分，前置逻辑和后置逻辑，称为A和B。
    // 在 Solidity 中，当一个函数使用多个修改器时，修改器的调用顺序是从左到右。具体过程如下：
    // 从左到右依次调用修改器的前置逻辑。
    // 遇到 _;在执行下一个修改器，最后一个修改器赋值执行被修改的函数体。
    // 每个修改器的 _; 表示函数体的执行位置。
    // 函数体执行完毕后，从右到左依次调用修改器的后置逻辑。

    function test1() public mf1(a) mf2 mf3 {
        console.log("test1");
    }
}