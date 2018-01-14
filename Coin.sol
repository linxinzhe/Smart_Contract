pragma solidity ^0.4.0;
contract Coin{
    address public minter;
    mapping (address=>uint) public balances;

    event Sent(address from,address to,uint amount);

    function Coin() public{
        minter=msg.sender;
    }

    function mint(address receiver,uint amount) public{
        if(msg.sender!=minter) return;
        balances[receiver]+=amount;
    }

    funciton send(address receiver,uint amount) public{
        if(balances[msg.sender]<amount)return;
        balances[msg.sender]-=amount;
        balances[receiver] += amount;
        Sent(msg.sender,receiver,amount);
    }
}