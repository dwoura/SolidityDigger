# ERC20 Brief Summary
##  Method abstract (9func + 2event)
view function
+ ```name() public view returns (string memory)```
+ ```symbol() public view returns (string memory)```
+ ```decimals() public view returns (uint8)``` 精度是 uint8 类型
+ ```totalsupply() public view returns (uint256)```

not view function
+ ```balanceOf(address _owner) public returns (uint256 balance)``` 查询某个账户的该代币数量
+ ```transfer(address _to, uint256 _value) public returns (bool success)``` 调用者转出其余额到指定地址
+ ```transferFrom(address _from, address _to, uint256 _value) public returns (bool success)``` 合约把某个账户代币转到另一个账户中，前提 allowance 足够
+ ```approve(address _spender,uint256 _value) public returns (bool success)``` 批准某个账户能转走的数量，再执行会覆盖 value
+ ```allowance(address _owner,address _spender) public returns (uint256 remaining) ``` 某个账户还能转走的数量

event
+ ```Transfer(address indexed _from, address indexed _to, uint256 _value)``` transfer和 transferFrom 函数都要触发此事件
+ ```Approval(address indexed _owner, address indexed _spender, uint256 _value)``` approve完成执行此事件