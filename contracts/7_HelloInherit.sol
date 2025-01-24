// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";

// 1. 父类中可以定义虚函数，用virtual描述，该函数可以被子类重写
// 2. 子类中使用override描述重写
// 3. 父类和子类都可以定义构造函数，调用顺序：父类构造函数、子类构造函数
// 4. 父类构造函数无参数，会自动调用，有参数则需要子类显式调用
contract Base {
    uint public a;

    // 只能有一个构造函数
    // constructor() {
    //     console.log("Base constructor");
    // }

    constructor(uint _a) {
        console.log("Base constructor with parameter");
        a = _a;
    }
    // virtual表示可以重写
    function foo() virtual public {
        console.log("Base foo");
        a += 2;
    }
}

contract Base1 {
    uint public a1;

    constructor() {
        console.log("Base1 constructor");
    }
}

// 写法1：contract Sub is Base(1) {
// 写法2：constructor() Base(1) {
// 写法3：constructor(uint _b) Base(_b/2) {
contract Sub is Base {
    uint public b;

    // constructor() Base(1) {
    //     console.log("Sub constructor");
    //     b = 2;
    // }

    constructor(uint _b) Base(_b/2) {
        console.log("Sub constructor");
        b = 2;
    }

    // 函数重写 overriding
    function foo() public override {
        // 调用父类函数
        // super.foo();
        console.log("Sub foo");
        a += 1;
    }
}


contract Sub1 is Base(1), Base1 {
    constructor() {
        console.log("Sub1 constrctor");
    }
}


