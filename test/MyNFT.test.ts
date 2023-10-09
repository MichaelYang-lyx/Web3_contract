import { expect } from "chai";
import { ethers } from "hardhat";

describe("Given MyNFT", function () {
  it("Should be able to award", async function (){
    const [owner, otherAddress, ...rest] = await ethers.getSigners();
    const MyToken = await ethers.getContractFactory("MyNFT");
    const myToken = await MyToken.deploy();
    await myToken.deployed();

    


    // mint a new NFT
    const merchantID = 1923;
    const productID = 21; 
    const lastTradeId = 839232; 

    let tx = await myToken.awardItem(
    owner.address,
    "https://www.google.com",
    owner.address,
    productID,
    lastTradeId,
    "unused");
    await tx.wait();

    let tokenOwner = await myToken.ownerOf(0);
    expect(tokenOwner).to.equal(owner.address);

    let tokenURI = await myToken.tokenURI(0);
    expect(tokenURI).to.equal("https://www.google.com");

    tx = await myToken.awardItem(
    otherAddress.address,
    "https://www.google.com/hk",
    otherAddress.address,
    productID,
    lastTradeId,
    "unused");
    await tx.wait();

    tokenOwner = await myToken.ownerOf(1);
    expect(tokenOwner).to.equal(otherAddress.address);

    tokenURI = await myToken.tokenURI(1);
    expect(tokenURI).to.equal("https://www.google.com/hk");
  });
});