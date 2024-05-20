// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {Test,console} from "forge-std/Test.sol";
import {MyToken} from "contracts/week1/MyToken.sol";

contract MyTokenTest is Test{
    MyToken myToken;
    // 生成的测试合约
    address public addr_a; 
    address public addr_b;
    address public addr_c; 

    function setUp() public{
        addr_a = vm.addr(1); // 生成一个新的 EOA
        addr_b = vm.addr(2); // 生成一个新的 EOA
        addr_b = vm.addr(3); // 生成一个新的 EOA
        vm.deal(addr_a, 1000 ether); // 作弊器给账户1000e
        vm.deal(addr_b, 1000 ether); // 作弊器给账户1000e
        vm.deal(addr_c, 1000 ether); // 作弊器给账户1000e

        // 重点：开始与关闭msg.sender的模拟
        vm.startPrank(addr_a); 
        myToken = new MyToken();
        vm.stopPrank();
    }

    function testName() public view{
        assertEq(myToken.name(), "MyToken");
    }

    function testSymbol() public view {
        assertEq(myToken.symbol(), "MT");
    }

    function testDecimals() public view {
        assertEq(myToken.decimals(), 9);
    }

    function testTotolSupply() public view {
        assertEq(myToken.totalSupply(), 21000000*(10**9));
    }

    function testTransfer() public {
        // 测试 a 转账到 b
        vm.startPrank(addr_a);
        myToken.transfer(addr_b, 123); // 测试转账123个 MT
        vm.stopPrank();
        assertEq(myToken.balanceOf(addr_b), 123);
    }

    function testApprove() public {
        vm.startPrank(addr_a);
        myToken.approve(addr_b, 200); // a 授权200个给 b
        vm.stopPrank();

        assertEq(myToken.allowance(addr_a, addr_b), 200);
    }

    function testTransferFrom() public {
        // a 授权200个给 b
        vm.startPrank(addr_a);
        myToken.approve(addr_b, 200); 
        vm.stopPrank();

        // b 从 a 中transfer 到 c
        vm.startPrank(addr_b);
        myToken.transferFrom(addr_a, addr_c, 200);
        vm.stopPrank();

        // 断言 c 中是否到账
        assertEq(myToken.balanceOf(addr_c), 200);
    }
}