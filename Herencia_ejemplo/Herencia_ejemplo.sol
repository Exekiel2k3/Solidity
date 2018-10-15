pragma solidity ^0.4.0;

contract Mortal{
    address public owner;
    
    function Mortal(){
        owner = msg.sender;
    }
    
    modifier onlyOwner{
        if(msg.sender != owner){
            throw;
        }else{
            _;
        }
    }
    
    function kill() onlyOwner {
        suicide(owner);
    }
}

contract User is Mortal{
    string public userName;
    
    function User(string _name) {
        userName = _name;
    }
}

contract Provider is Mortal{
    string public userName;
    
    function Provider(string _name) {
        userName = _name;
    }
}
