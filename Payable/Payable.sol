pragma solidity ^0.4.0;

contract PayableContract{
    
    //Constructor
    function PayableContract(){
        
    }
    
    function recieveFounds() payable {
        
    }
    
    function getBalance() constant returns(uint){
        return this.balance;
    }
    
}
