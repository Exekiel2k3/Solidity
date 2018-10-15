pragma solidity ^0.4.24;

import "./Ownable.sol";

contract Access is Ownable {

    event eventNewAccess(uint16 idAccess, address adressAccess, address owner);
    event eventAccessGranted(address adressAccess, uint timeStamp);
    event eventRemovePermissions(uint16 idAccess, address adressRemoved, address owner);
    
    
    uint16 idAccess;
    mapping (uint16 => address) public accessList;
    
    /**
     * @dev Lanza un error si lo llama la direccion cero 
     */
    modifier notAdressCero(){
        require(msg.sender != address(0));
        _;
    }
    
    /**
     * @dev Contructor del contrato Acces.
     * @notice Inicializa la variable idAcces
     */
    constructor() public {
    }
    
    // **
    // @dev Da de alta el permiso de acceso para una cuenta y asigna in numero de idAcces.
    //      Solo el dueño puede dar acceso.
    // @param _idAcces id de acceso asociado a la direccion.
    // @param _adress es la direccion a la que se le da acceso
    // **
    function givePermission(uint16 _idAccess, address _adress) public onlyOwner {
        accessList[_idAccess] = _adress;
        emit eventNewAccess(_idAccess, _adress, msg.sender);
    }
    
    // **
    // @dev Permite el acceso a las direcciones registradas mediante el id de acceso.
    // @param _idAcces id de acceso asociado a la direccion.
    // @return true/false, indica si la direccion tiene acceso o no.
    // **
    function toAccess(uint16 _idAccess) public notAdressCero returns(bool){
        
        if(accessList[_idAccess] != msg.sender ){
            return false;
        }
        emit eventAccessGranted(accessList[_idAccess], now);
        return true;
    }
    
    
    function removePermissions(uint16 _idAccess) public onlyOwner {
        emit eventRemovePermissions(_idAccess, accessList[_idAccess], msg.sender);
        delete accessList[_idAccess];
    }
    
}
