# 第一周日志
## 一些要点
+ 区块链如同一个账本，而合约如同一个账本页，上面记录着各种属性与交易细节。
+ 对于 erc20 代币的转账，也并非实际意义上的转账，而是在“账本页”上对有关账户的余额进行数字的增大和减小。
+ allowance 是调用者 approve 某个受益者账户spender指定额度后的可用额度。 allowance是二维map，一个账户可能会有多个spender。
+ this 代表当前合约地址。tx.origin 是交易的原始发起地址。msg.sender 是调用者地址。