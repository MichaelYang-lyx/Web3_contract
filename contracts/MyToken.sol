// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MSBD5017Token is ERC20 {
    constructor() ERC20("MSBD5017", "M57") {
        _mint(msg.sender, 1000);
    }
}