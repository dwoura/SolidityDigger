// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "./IERC20.sol";

contract MyToken is IERC20{
    string public _name;
    string public _symbol;
    uint8 public _decimals;
    uint256 public _totalSupply;
    mapping (address => uint256) _balance;
    mapping (address => (address => uint256)) allowance;

    event Transfer(address indexed _from, address indexed _to, uint256 _value); 
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    constructor(){
        _name = "MyToken";
        _symbol = "MT";
        _decimals = 9;
        _totalSupply = 21000000*(10**_decimals);
    }

    function name() public view returns(string memory){
        return _name;
    }

    function symbol() public view returns(string memory){
        return _symbol;
    }

    function decimals() public view returns(uint8){
        return _decimals;
    }

    function totalSupply() public view returns(uint256){
        return _totalSupply;
    }

    function balanceOf(address _owner) public returns(uint256 balance){
        balance = _balance[_owner];
        return balance;
    }

    function transfer(address _to, uint256 _value) public returns(bool success){
        //require
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        success = true;
        
        emit Transfer(msg.sender, _to, _value);
        return success;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns(bool success){
        //require(_value >= allowance[_from][msg.sender], "allowance not enough.");
        allowance[_from][msg.sender] -= _value;
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        
        success = true;

        emit Transfer(_from, _to, _value);
        return success;
    }

    function approve(address _spender, uint256 _value) public returns(bool success){
        allowance[msg.sender][_spender] = _value;
        

    }
}