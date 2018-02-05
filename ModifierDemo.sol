pragma solidity ^0.4.0;

contract ModifierDemo {
    address public owner;
    uint public u;
    
    function ModifierDemo() {
        owner = msg.sender;
    }
    
    modifier onlyOwner{
        if(msg.sender != owner ) {  //条件不满足就抛异常
            throw;  
        }else {  //满足则执行被修饰的函数，固定写法
            _;
        }
    }
    
    function set(uint _u) onlyOwner {
        u = _u;
    }
}