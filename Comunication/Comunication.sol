pragma solidity ^0.4.0;

contract CallerContract{
    CalledContract toBeCalled = CalledContract(0xb87213121fb89cbd8b877cb1bb3ff84dd2869cfa);
    
    function getNumber() constant returns(uint){
        return toBeCalled.getNumber();
    }
}

contract CalledContract{
    
    uint number = 500;
    
    function getNumber() constant returns(uint){
        return number;
    }
}
