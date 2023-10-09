// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyNFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    struct Token {
        uint tokenId;
        address owner;
        address merchant;
        uint productId;
        uint lastTradeId;
        string state;
    }

    mapping(uint => Token) public tokens;

    constructor() ERC721("MyNFT", "NFT") {}

    function awardItem(address player, string memory tokenURI, address _merchant, uint _productId, uint _lastTradeId,string memory _state)
        public
        returns (uint256)
    {
        uint256 newItemId = _tokenIds.current();
        _mint(player, newItemId);
        _setTokenURI(newItemId, tokenURI);

        tokens[newItemId] = Token(newItemId, player, _merchant, _productId, _lastTradeId, _state);

        _tokenIds.increment();
        return newItemId;
    }

    // return token information
    function getToken(uint tokenId) public view returns (Token memory) {
    return tokens[tokenId];
}

}
