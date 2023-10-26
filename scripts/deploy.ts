import { ethers } from "hardhat";

async function main() {
  const Contract = await ethers.getContractFactory("Token");
  const contract = await Contract.deploy(1000, "Apple", "a001");

  await contract.deployed();
  console.log("Contract deployed to:", contract.address);

  const [deployer] = await ethers.getSigners();
  console.log("Deployer address:", deployer.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
