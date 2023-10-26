import { expect } from "chai";
import { ethers } from "hardhat";
describe("Given MyToken", function () {
    it("Owner should get the initial supply and should mint correctly", async function () {
      const [owner] = await ethers.getSigners();
      const MyToken = await ethers.getContractFactory("Token");
      const myToken = await MyToken.deploy(1000, "Apple", "a001");
      await myToken.deployed();
      const ownerBalance = await myToken.balanceOf(owner.address);
      expect(ownerBalance).to.equal(1000);


      myToken.mint(owner.address, 100);

      const tname_ = await myToken.getTname();
      console.log(tname_);
      expect(tname_).to.equal('Apple');
      const ownerBalance2 = await myToken.balanceOf(owner.address);
      expect(ownerBalance2).to.equal(1100);
    });
  });