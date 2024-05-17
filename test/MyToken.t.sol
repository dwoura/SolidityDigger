// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {Test,console} from "forge-std/Test.sol";
import {MyToken} from "contracts/week1/MyToken.sol";

contract MyTokenTest is Test{
    MyToken myToken;

    function setUp() public{
        myToken = new MyToken();
    }

    function testName() public {
        assertEq(myToken.name(), "MyToken");
    }

    function testSymbol() public {
        assertEq(myToken.symbol(), "MT");
    }

    function testDecimals() public {
        assertEq(myToken.decimals(), 9);
    }

    function testTotolSupply() public {
        assertEq(myToken.totalSupply(), 21000000*(10**9));
    }
}