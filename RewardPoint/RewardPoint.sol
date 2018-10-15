pragma solidity ^0.4.24;

import "./Ownable.sol";

contract RewardPoint is Ownable{
    
    struct Employee {
        string firstName;
        string lastName;
        address addressEmployee;
        uint16 amountPoints;
    }
	
	struct Company{
		string companyName;
		uint16 maxLimitsPoints;
		uint16 idCompany;
	}
    
    mapping (uint16 => Employee) employees;
	mapping (uint16 => Company) company;
    
    /**
     * @dev Contructor del contrato Acces.
     * @notice Inicializa la variable idAcces
     */
    constructor(string _companyName, uint16 _maxPoints) public {
        maxPoints = _maxPoints;
		company[]
    }
    
	
	
    function newBeneficiary (string _firstName, string _lastName, address _addressEmployee, uint16 _fileId) public onlyOwner {
        require(employees[_fileId].addressEmployee != _addressEmployee);
        employees[_fileId] = Employee(_firstName,_lastName,_addressEmployee, maxPoints);
    }
    
    
    
}
