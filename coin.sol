// SPDX-License-Identifier: MIT
pragma solidity  >=0.8.17 <0.9.0 ;

contract coin{
    address public minter;
    mapping (address => uint) public balances;

    event Sent(address from, address to, uint amount);

    constructor() {
        minter = msg.sender;
    }
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }
    error InsuficientBalance(uint requested, uint available);
    
    function send(address receiver, uint amount) public{
        require(amount <= balances[msg.sender], InsuficientBalance(amount, balances[msg.sender]));
        balances
    }
}