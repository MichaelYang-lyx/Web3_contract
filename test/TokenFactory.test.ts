const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("TokenFactory", function () {
  it("Should create a new token and add it to the list", async function () {
    const TokenFactory = await ethers.getContractFactory("TokenFactory");
    const tokenFactory = await TokenFactory.deploy();
    await tokenFactory.deployed();


    
    const newaddress=await tokenFactory.createToken(1000, "Apple", "a001");
    console.log(newaddress);
    const tokenCount = await tokenFactory.tokenCount();
    const tokenAddress = await tokenFactory.list_of_tokens(tokenCount-1);
    console.log(tokenAddress);
 
    /*
    console.log(result)
    console.log("2222")

    const tokenAddress = await tokenFactory.list_of_tokens(0);
    console.log(typeof tokenAddress);
    const token_1 = new ethers.Contract(tokenAddress)
    console.log(typeof token_1);

    const tname_ = await token_1.getTname();
    console.log(tname_);
    console.log("3333");
    expect(token_1.length).to.equal(42);
    */

  });
});
