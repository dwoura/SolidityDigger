// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract MyToken is IERC20{
    string immutable _name;
    string immutable _symbol;
    uint8 immutable _decimals;
    uint256 immutable _totalSupply;

    constructor(){
        _name = "MyToken";
        _symbol = "MT";
        _decimals = 10**9;
        _totalSupply = 21000000;
    }

    function name() public view returns(string){
        returns _name;
    }

}