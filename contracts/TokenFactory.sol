// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./Token.sol";


contract TokenFactory {


  address[] public list_of_tokens;
  
  uint256 public tokenCount;
  event TokenDeployed(address tokenAddress);

  constructor() 
    {
    tokenCount=0;
    }

 function createToken(uint256 _initialSupply, string memory _tname, string memory _tiker) public returns (address tokenAddress){
    tokenCount++;
    Token token = new Token(_initialSupply, _tname, _tiker);
    token.transfer(msg.sender, _initialSupply);
    list_of_tokens.push(address(token));

    emit TokenDeployed(address(token));
    return address(token);
  }
}

