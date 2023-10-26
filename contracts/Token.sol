// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";


contract Token is ERC20, ERC20Burnable, Ownable{

    string public tname;
    string public tiker;
    
    

    // _tname is the name of token and _ticker is the id of the token
    constructor(uint256 initialSupply, string memory _tname, string memory _tiker) 
        ERC20(_tname, _tiker) 
        Ownable()
        {   tname=_tname;
            tiker=_tiker;
            _mint(msg.sender, initialSupply);}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // return token information
    function getTname() public view returns (string memory) {
        return tname;
    }

    
    function decimals() public view virtual override returns (uint8) {
        return 2;
    }

    function getTiker() public view returns (string memory) {
        return tiker;
    }
    }