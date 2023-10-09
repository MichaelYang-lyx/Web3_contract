/*
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract Voucher is ERC1155 {
    struct Token {
        uint tokenId;
        address owner;
        address merchant;
        uint productId;
        uint lastTradeId;
    }

    mapping (uint => Token) public tokens;
    uint public tokenCounter;

    event Minted(uint tokenId, address owner, address merchant, uint productId);
    event Transferred(uint tokenId, address from, address to);

    modifier onlyOwner(uint tokenId) {
        require(tokens[tokenId].owner == msg.sender, "Only the owner of the token can transfer it");
        _;
    }

    constructor(string memory uri) ERC1155(uri) {
        tokenCounter = 0;
    }

    function mint(address owner, address merchant, uint productId) public returns (uint) {
        tokenCounter++;
        uint tokenId = tokenCounter;
        tokens[tokenId] = Token(tokenId, owner, merchant, productId, 0);
        _mint(owner, tokenId, 1, "");
        emit Minted(tokenId, owner, merchant, productId);
        return tokenId;
    }

    function transfer(uint tokenId, address to) public onlyOwner(tokenId) returns (bool) {
        address from = msg.sender;
        tokens[tokenId].owner = to;
        tokens[tokenId].lastTradeId++;
        safeTransferFrom(from, to, tokenId, 1, "");
        emit Transferred(tokenId, from, to);
        return true;
    }
}
*/