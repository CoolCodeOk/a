// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";

contract owned {
    address owner;
    uint a;
    uint a1;
    uint a2;
    uint a3;

    
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
        uint c = b;
        _; // mf2
        c = a;
        a = 11;
    }

     modifier mf2 () {
        a1 = a + 1;
        _; // mf3
    }

    modifier mf3() {
        a = 12;
        a2 = a + 1;
        return ; // return to mf2，最终到47行
        _; // 原始函数，执行不到
        a = 13;
    }

    function get_a() public view returns (uint, uint, uint, uint)   {
        return (a, a1, a2, a3);
    }

    // 最后一个mf3负责调用test1函数
    function test1() public mf1(a) mf2 mf3 {
        a3 = a + 1;
        a = 1;
    }
}