# ERC20 Brief Summary
##  Method abstract (9func + 2event)
view function
+ name() public view returns (string)
+ symbol() public view returns (string)
+ decimals() public view returns (uint8)
+ totalsupply() public view returns (uint256)

not view function
+ balanceOf(address _owner) public returns (uint256 balance)
+ transfer(address _to, uint256 _value) public returns (bool success)
+ transferFrom(address _from, address _to, uint256 _value) public returns (bool success)
+ approve(address _spender,uint256 _value) public returns (bool success)
+ allowance(address _owner,address _spender) public returns (uint256 remaining) 

event
+ Transfer(address indexed _from, address indexed _to, uint256 _value)
+ Approval(address indexed _owner, address indexed _spender, uint256 _value)