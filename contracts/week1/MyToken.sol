// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "./IERC20.sol";

contract MyToken is IERC20{
    string public _name;
    string public _symbol;
    uint8 public _decimals;
    uint256 public _totalSupply;
    mapping (address => uint256) _balance;
    mapping (address => mapping(address => uint256)) _allowance;

    address public _admin;

    //string name, string symbol
    constructor(){
        _name = "MyToken";
        _symbol = "MT";
        _decimals = 9;
        _admin = msg.sender;
        mint(msg.sender, 21000000*(10**_decimals)); // 初始化mint 包含了初始化_totalSupply
    }

    modifier onlyOwner() {
        require(msg.sender == _admin, "Only admin can do this.");
        _;
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

    function balanceOf(address _owner) public view returns(uint256 balance){
        balance = _balance[_owner];
        return balance;
    }

    function transfer(address _to, uint256 _value) public returns(bool success){
        require(_value <= _balance[msg.sender], "your balance not enough.");
        _balance[msg.sender] -= _value;
        _balance[_to] += _value;
        success = true;
        
        emit Transfer(msg.sender, _to, _value);
        return success;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns(bool success){
        require(_value <= _allowance[_from][msg.sender], "allowance not enough.");
        require(_value >= _balance[msg.sender], "you balance not enough.");
        _allowance[_from][msg.sender] -= _value;
        _balance[_from] -= _value;
        _balance[_to] += _value;
        
        success = true;

        emit Transfer(_from, _to, _value);
        return success;
    }

    function approve(address _spender, uint256 _value) public returns(bool success){
        _allowance[msg.sender][_spender] = _value;
        
        success = true;
        emit Approval(msg.sender, _spender, _value);
        return success;
    }

    function allowance(address _owner, address _spender) public view returns(uint256 remaining){
        remaining = _allowance[_owner][_spender];
        return remaining;
    }

    function mint(address _to, uint256 _value) public onlyOwner returns(bool success){
        _totalSupply += _value;
        _balance[_to] += _value;

        success = true;
        emit Transfer(address(0), _to, _value);
        return success;
    }

    function burn(address _from, uint256 _value) public returns(bool success){
        require(_balance[_from] >= _value, "your balance not enough.");
        _balance[_from] -= _value;
        _totalSupply -= _value;
        success = true;
        emit Transfer(_from, address(0), _value);
    }
}