pragma solidity >=0.8.17 <0.9.0;

contract Coin {
    address public minter;
    mapping(address => uint) public balances;
    
    event Sent(address from, address to, uint amount);
    
    constructor() {
        minter = msg.sender;
    }
    
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter, "Only minter can mint");
        balances[receiver] += amount;
    }
    
    error InsufficientBalance(uint requested, uint available);
    
    function send(address receiver, uint amount) public {
        if (amount > balances[msg.sender]) {
            revert InsufficientBalance(amount, balances[msg.sender]);
        }
        
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}