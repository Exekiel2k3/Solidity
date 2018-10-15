pragma solidity ^0.4.0;

contract PayCheck{
    
    address[] employees = [ 0x14723a09acff6d2a60dcdf7aa4aff308fddc160c, 
                            0x4b0897b0513fdc7c541b6d9d7e929c4e5364d2db,
                            0x583031d1113ad414f02576bd6afabfb302140225,
                            0xdd870fa1b7c4700f2bd7f44238821c26f7392148];
    
    uint totalRecieved = 0;
    
    mapping (address => uint) withDrownAmmounts;
    
    function withDrown() canWithDrown {
        uint amountAllocated = totalRecieved/employees.length;
        uint amountWithDrown = withDrownAmmounts[msg.sender];
        uint amount = amountAllocated - amountWithDrown;
        withDrownAmmounts[msg.sender] = amountWithDrown + amount;
        if(amount > 0){
            msg.sender.transfer(amount);
        }
    }
    
    function PayCheck() payable{
        updateTotal();    
    }
    
    // Se ejecuta cada ves que se le envia plata al contrato
    function () payable{
        updateTotal();
    }
    
    function updateTotal() internal {
        totalRecieved += msg.value;
    }
    
    modifier canWithDrown(){
        bool contains = false;
        
        for(uint i=0; i < employees.length; i++){
            if(employees[i] == msg.sender){
                contains = true;
            }
        }
        
        require(contains);
        _;
    }
}
